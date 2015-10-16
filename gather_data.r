#' ---
#' title: "Oregon Climate Service Data Acquisition"
#' author: "M. Edward (Ed) Borasky"
#' date: "2015-10-16"
#' output:
#'   md_document:
#'     variant: markdown_github
#' ---

#' ## Install and load required library packages
for (p in c("rvest")) {
  if (!require(p, character.only = TRUE)) {
    install.packages(p)
  }
  require(p, character.only = TRUE)
}

#' ## Fetch the main page as an rvest session
session <- html_session(
  "http://www.ocs.oregonstate.edu/county_climate/county_climate.html")
#' ## Loop over the county data pages
for (i in 4:39) {
  page <- session %>% follow_link(i)
}
