#' R notebook to gather data from the Oregon Climate Service website (<http://ocs.oregonstate.edu/>)
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
