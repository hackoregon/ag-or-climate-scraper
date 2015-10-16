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

``` r
session <- html_session(
  "http://www.ocs.oregonstate.edu/county_climate/county_climate.html")
for (i in 4:39) {
  page <- session %>% follow_link(i)
  print(page)
}
```

    ## Navigating to Baker_files/Baker.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Baker_files/Baker.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   60217

    ## Navigating to Benton_files/Benton.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Benton_files/Benton.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   54776

    ## Navigating to Clackamas_files/Clackamas.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Clackamas_files/Clackamas.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   107760

    ## Navigating to Clatsop_files/Clatsop.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Clatsop_files/Clatsop.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   70381

    ## Navigating to Columbia_files/Columbia.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Columbia_files/Columbia.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   71575

    ## Navigating to Coos_files/Coos.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Coos_files/Coos.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   63443

    ## Navigating to Crook_files/Crook.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Crook_files/Crook.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   52870

    ## Navigating to Curry_files/Curry.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Curry_files/Curry.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   61269

    ## Navigating to Deschutes_files/Deschutes.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Deschutes_files/Deschutes.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   69934

    ## Navigating to Douglas_files/Douglas.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Douglas_files/Douglas.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   82753

    ## Navigating to Gilliam_files/Gilliam.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Gilliam_files/Gilliam.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   48393

    ## Navigating to Grant_files/Grant.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Grant_files/Grant.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   77079

    ## Navigating to Harney_files/Harney.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Harney_files/Harney.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   53512

    ## Navigating to Hood%20River_files/Hood%20River.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Hood%20River_files/Hood%20River.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   42828

    ## Navigating to Jackson_files/Jackson.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Jackson_files/Jackson.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   64385

    ## Navigating to Jefferson_files/Jefferson.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Jefferson_files/Jefferson.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   69023

    ## Navigating to Josephine_files/Josephine.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Josephine_files/Josephine.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   60257

    ## Navigating to Klamath_files/Klamath.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Klamath_files/Klamath.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   72315

    ## Navigating to Lake_files/Lake.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Lake_files/Lake.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   87715

    ## Navigating to Lane_files/Lane.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Lane_files/Lane.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   122102

    ## Navigating to Lincoln_files/Lincoln.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Lincoln_files/Lincoln.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   63668

    ## Navigating to Linn_files/Linn.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Linn_files/Linn.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   79512

    ## Navigating to Malheur_files/Malheur.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Malheur_files/Malheur.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   87436

    ## Navigating to Marion_files/Marion.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Marion_files/Marion.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   83271

    ## Navigating to Morrow_files/Morrow.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Morrow_files/Morrow.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   55586

    ## Navigating to Multnomah_files/Multnomah.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Multnomah_files/Multnomah.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   71373

    ## Navigating to Polk_files/Polk.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Polk_files/Polk.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   55293

    ## Navigating to Sherman_files/Sherman.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Sherman_files/Sherman.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   49995

    ## Navigating to Tillamook_files/Tillamook.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Tillamook_files/Tillamook.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   49137

    ## Navigating to Umatilla_files/Umatilla.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Umatilla_files/Umatilla.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   63634

    ## Navigating to Union_files/Union.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Union_files/Union.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   57689

    ## Navigating to Wallowa_files/Wallowa.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Wallowa_files/Wallowa.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   52592

    ## Navigating to Wasco_files/Wasco.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Wasco_files/Wasco.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   55026

    ## Navigating to Washington_files/Washington.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Washington_files/Washington.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   59443

    ## Navigating to Wheeler_files/Wheeler.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Wheeler_files/Wheeler.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   53700

    ## Navigating to Yamhill_files/Yamhill.html

    ## <session> http://www.ocs.oregonstate.edu/county_climate/Yamhill_files/Yamhill.html
    ##   Status: 200
    ##   Type:   text/html; charset=UTF-8
    ##   Size:   46436
