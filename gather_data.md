Install and load required library packages
------------------------------------------

``` r
for (p in c("rvest")) {
  if (!require(p, character.only = TRUE)) {
    install.packages(p)
  }
  require(p, character.only = TRUE)
}
```

    ## Loading required package: rvest
    ## Loading required package: xml2

Fetch the main page as an rvest session
---------------------------------------

``` r
session <- html_session(
  "http://www.ocs.oregonstate.edu/county_climate/county_climate.html")
```

Loop over the county data pages
-------------------------------

``` r
for (i in 4:39) {
  page <- session %>% follow_link(i)
}
```

    ## Navigating to Baker_files/Baker.html
    ## Navigating to Benton_files/Benton.html
    ## Navigating to Clackamas_files/Clackamas.html
    ## Navigating to Clatsop_files/Clatsop.html
    ## Navigating to Columbia_files/Columbia.html
    ## Navigating to Coos_files/Coos.html
    ## Navigating to Crook_files/Crook.html
    ## Navigating to Curry_files/Curry.html
    ## Navigating to Deschutes_files/Deschutes.html
    ## Navigating to Douglas_files/Douglas.html
    ## Navigating to Gilliam_files/Gilliam.html
    ## Navigating to Grant_files/Grant.html
    ## Navigating to Harney_files/Harney.html
    ## Navigating to Hood%20River_files/Hood%20River.html
    ## Navigating to Jackson_files/Jackson.html
    ## Navigating to Jefferson_files/Jefferson.html
    ## Navigating to Josephine_files/Josephine.html
    ## Navigating to Klamath_files/Klamath.html
    ## Navigating to Lake_files/Lake.html
    ## Navigating to Lane_files/Lane.html
    ## Navigating to Lincoln_files/Lincoln.html
    ## Navigating to Linn_files/Linn.html
    ## Navigating to Malheur_files/Malheur.html
    ## Navigating to Marion_files/Marion.html
    ## Navigating to Morrow_files/Morrow.html
    ## Navigating to Multnomah_files/Multnomah.html
    ## Navigating to Polk_files/Polk.html
    ## Navigating to Sherman_files/Sherman.html
    ## Navigating to Tillamook_files/Tillamook.html
    ## Navigating to Umatilla_files/Umatilla.html
    ## Navigating to Union_files/Union.html
    ## Navigating to Wallowa_files/Wallowa.html
    ## Navigating to Wasco_files/Wasco.html
    ## Navigating to Washington_files/Washington.html
    ## Navigating to Wheeler_files/Wheeler.html
    ## Navigating to Yamhill_files/Yamhill.html
