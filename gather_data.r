#' ---
#' title: "Oregon Climate Service Data Acquisition"
#' author: "M. Edward (Ed) Borasky"
#' date: "2015-10-16"
#' output:
#'   md_document:
#'     variant: markdown_github
#' ---

#' ## Install and load required library packages
for (p in c("rvest", "httr")) {
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
  text <- content(page$response, as = "text")
  county <- sub("^.*<title>", "", text)
  county <- sub(" County Climate.*$", "", county)
  if (county != "Grant") {
    precip_node <- html_node(page, css = "tr:nth-child(1) table")
    precip_table <- html_table(precip_node, header = TRUE)
    precip_table$County <- county
    print(precip_table)
  }
}
