#' ---
#' title: "Using `rnoaa` to Acquire Climate Data"
#' author: "M. Edward (Ed) Borasky"
#' date: "May 22, 2016"
#' ---

#' ### Getting an API token
#' 1. Go to <http://www.ncdc.noaa.gov/cdo-web/token>.
#' 1. Enter your email address in the form.
#' 1. Press "Submit".
#' 1. Get the API token from your email.
#' 1. Store it in global variable `cdo_token`.

# Install the library packages if needed
if (!require(rnoaa)) {
  install.packages('rnoaa')
}
if (!require(dplyr)) {
  install.packages('dplyr')
}

# Load the libraries and FIPS code dataset
require(rnoaa)
require(dplyr)
if (file.exists("fipscodes.csv")) {
  fipscodes <- read.csv("fipscodes.csv", stringsAsFactors = FALSE)
} else {
  data(fipscodes)
  fipscodes <- dplyr::filter(fipscodes, state == "Oregon")
  fipscodes <- dplyr::select(fipscodes, -fips_state, -fips_county)

  # save fipscodes as a CSV
  write.csv(fipscodes, file = "fipscodes.csv", row.names = FALSE)
}

# Make the station table

# define a function to fetch the stations in a single county
dataset <- "NORMAL_MLY" # the "monthly normals" dataset
county_stations <- function(fipscodes, irow) {
  fips <- fipscodes$fips[irow]
  work <- ncdc_stations(
    datasetid = dataset, token = cdo_token, limit = 1000,
    locationid = paste("FIPS", fips, sep = ":"))
  work <- work$data
  work$fips <- fips
  colnames(work)[7] <- "station_id"
  work <- dplyr::inner_join(fipscodes, work, by = "fips")
  return(work)
}

if (file.exists("station_table.csv")) {
  station_table <- read.csv("station_table.csv", stringsAsFactors = FALSE)
} else {

  # first county
  print(paste("Fetching stations for county =", fipscodes$county[1]))
  station_table <- county_stations(fipscodes, 1)

  # rest of the counties
  for (irow in 2:(nrow(fipscodes))) {
    print(paste("Fetching stations for county =", fipscodes$county[irow]))
    station_table <- dplyr::bind_rows(
      station_table, county_stations(fipscodes, irow))
  }

  # save
  write.csv(station_table, file = "station_table.csv", row.names = FALSE)
}

# Make the data table

# function to fetch the data for a single station
start <- "2010-01-01" # required start date parameter
end <- "2010-12-01" # required end date parameter

# data types (variables) to fetch
# "MLY-GRDD-BASE50" is growing degree days with 50 degrees Fahrenheit as the base
# "MLY-PRCP-NORMAL" is precipitation in *hundredths* of an inch
variables <- c("MLY-GRDD-BASE50", "MLY-PRCP-NORMAL")
station_data <- function(station_table, irow) {
  station <- station_table$station_id[irow]
  work <- ncdc(
    datasetid = dataset, startdate = start, enddate = end,
    token = cdo_token, limit = 1000, stationid = station, datatypeid = variables)
  work <- work$data
  colnames(work)[3] <- "station_id"
  return(work)
}

if (file.exists("data_table.csv")) {
  data_table <- read.csv("data_table.csv", stringsAsFactors = FALSE)
} else {

  # first station
  print(paste("Fetching data for station", station_table$station_id[1]))
  data_table <- station_data(station_table, 1)

  # rest of the counties
  for (irow in 2:(nrow(station_table))) {
    print(paste("Fetching data for station", station_table$station_id[irow]))
    data_table <- dplyr::bind_rows(data_table, station_data(station_table, irow))
  }

  # save
  write.csv(data_table, file = "data_table.csv", row.names = FALSE)
}

# Make the result table

# replace -7777 with zerp - the official definition of "-7777" is
# "-7777: a non-zero value that would round to zero"
# NORMAL MLY documentation - Mark Lackey.pdf
data_table$value[data_table$value == -7777] <- 0

# tag data with station metadata
tagged_data <- dplyr::full_join(data_table, station_table, by = "station_id")
write.csv(tagged_data, file = "tagged_data.csv", row.names = FALSE)

# summary input table
station_summary <-
  tagged_data %>%
  dplyr::group_by(datatype, county, station_id) %>%
  dplyr::summarize(annual_total = sum(value), months = length(value))
write.csv(station_summary, file = "station_summary.csv", row.names = FALSE)
county_summary <-
  station_summary %>%
  dplyr::group_by(datatype, county) %>%
  dplyr::summarize(
    county_average = mean(annual_total), stations = length(annual_total))

# make final display tables
growing_degree_days <-
  county_summary %>%
  dplyr::filter(datatype == "MLY-GRDD-BASE50")
growing_degree_days$county_average <-
  round(growing_degree_days$county_average, digits = 0)
write.csv(
  growing_degree_days, file = "growing_degree_days.csv", row.names = FALSE)

precipitation_inches <-
  county_summary %>%
  dplyr::filter(datatype == "MLY-PRCP-NORMAL")

# convert precipitation to inches
# NORMAL MLY documentation - Mark Lackey.pdf
# Hundredths of inches for average monthly/seasonal/annual precipitation,
# month-to-date/year-to-date precipitation, and percentiles of precipitation.
# e.g., "1" is 0.01" and "1486" is 14.86"
precipitation_inches$county_average <-
  round(0.01 * precipitation_inches$county_average, digits = 2)
write.csv(
  precipitation_inches, file = "precipitation_inches.csv", row.names = FALSE)
