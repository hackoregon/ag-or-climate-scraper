#' ---
#' title: "Oregon Climate Service Data Acquisition"
#' author: "M. Edward (Ed) Borasky"
#' date: "2015-10-16"
#' output:
#'   md_document:
#'     variant: markdown_github
#' ---

for (p in c("rvest")) {
  if (!require(p, character.only = TRUE)) {
    install.packages(p)
  }
  require(p, character.only = TRUE)
}

session <- html_session(
  "http://www.ocs.oregonstate.edu/county_climate/county_climate.html")
for (i in 4:39) {
  page <- session %>% follow_link(i)
  print(page)
}
