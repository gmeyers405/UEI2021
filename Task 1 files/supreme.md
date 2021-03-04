State Trends in the Supreme Court
================
Gabrielle Meyers

## Introduction

**Research question:** What, if any, trends exist that might explain why
the Supreme Court has been more likely to hear cases from certain state
supreme courts and not others? Are there any noticeable trends amongst
these ten states in comparison to each other and the overall data?

## Setting Up

*Packages needed:* tidyverse, ggplot2

After importing all of my CSV files and combining them together, I
created a new dataset that would only keep the 50 states (ie filtering
out Puerto Rico, Guam, etc) and filter for cases starting in the 1960
term, which is the first term that we had all 50 states (Hawaii, last to
enter the Union, did so in 1959).

## Table of the Top Ten States

Most of my analysis will be comparing graphs based on data from all 50
states to individual graphs of the ten states that have most frequently
been the source of a Supreme Court case since 1960.

| State      | Frequency |
| :--------- | --------: |
| California |       164 |
| Florida    |       108 |
| New York   |       106 |
| Illinois   |        80 |
| Texas      |        73 |
| Louisiana  |        65 |
| Ohio       |        63 |
| Georgia    |        62 |
| Alabama    |        57 |
| Washington |        46 |

Frequency of Supreme Court Case Sources by State (1960-2020)

After determining the top ten states, I created a data frame restricted
to the ten states. I also created a special factor to reorder the states
by frequency as defined in the table rather than by alphabetical order.
As for the states themselves, I don’t think there’s any concrete
relation between the states themselves and how many cases reviewed by
their state courts have been taken to the Supreme Court. There isn’t
even proof that the fact that the list includes the three most populous
states (New York, California, and Texas) is more than a coincidence.
However, there is a wide representation of political leanings- 4 “blue”
states (CA, NY, IL, and WA), 4 “red” states (TX, LA, GA, and AL), and 2
swing states (FL and OH).

## Declarations of Unconstitutionality

In this section, we will determine if there is any relationship between
a case coming from a particular state court and the chance that it will
result in the Supreme Court making a declaration of unconstitutionality.

![](supreme_files/figure-gfm/fifty%20unconstitutional%20pt%202-1.png)<!-- -->

Declarations of unconstitutionality seem to be relatively uncommon
overall, never exceeding 45% as the result of cases in any given term
between 1960 and 2000. The shape of the graph indicates that there is no
real consistency in how many declarations of unconstitutionality a
Supreme Court may give in any given term, as the data seems to alternate
between realtive peaks and valleys rather than hold stagnant. The most
noticeable peak is in the late 1990s, followed by the most noticeable
valley at 2000. It seems that the Supreme Court is more likely to uphold
a law than to not.

![](supreme_files/figure-gfm/ten%20unconstitutional%20pt%202-1.png)<!-- -->

The distributions by state are widely different from the overall graph.
None of the states follow the trend of peaks followed by valleys, and
all of them have exceeded 50% of cases in a term being declared
unconstitutional. There do not seem to be any concrete trends in the
states. However, between the years 2000 and 2020, it seems as though
Alabama is just as likely to have a case result in a declaration of
unconstitutionality as New York. Alabama was also as likely to have a
case result in a declaration of unconstitutionality as Louisiana around
1980.

Overall, there is no real relationship between declarations of
unconstitutionality and state. It should also be noted that no cases
have resulted in a declaration of unconstitutionality in recent years
with the exception of Texas, implying that other states might be more to
have their state courts pass up cases to the Supreme Court that result
in a declaration of unconstitutionality.

## Decision Direction

Another factor I decided to analyze was the direction in which cases
went. I am curious to see how (or if) the political leanings of each
state (California liberal, Alabama conservative) will play a role in
these results. To start, I recalled a graph we made in HW03, which
determined what percentage of cases in each term resulted in a
conservative victory:

![](supreme_files/figure-gfm/fifty%20conservative%20pt%202-1.png)<!-- -->

Even though the Court has gotten more conservative in recent years, the
percentage of cases that have resulted in conservative wins seems to
have decreased overall. From 1980 forward there had been peaks followed
by valleys, but cases going into the 2010s have dipped below 40% and
then below 30%. According to the graph, conservatives haven’t faced such
a drop since the 1960s.

![](supreme_files/figure-gfm/ten%20conservative%20pt%202-1.png)<!-- -->

All the states (with the execptions of New York and Ohio, which seem to
not have had cases in the Supreme Court in the last few years) also
portray the drop in conservative victories in the mid to late 2010s.
However, this drop might have to do with the fact that the data does not
cover cases from the most recent term. About half of the states face the
dip in the 1960s, with New York, Florida, Texas, Louisiana, and Ohio all
showing upticks in conservative victories in the 1960s. Oddly enough,
liberal victories seem more likely to occur in cases sourced from
conservative states like Alabama, Louisiana, and Texas (with the
exception of Washington), while conservative victories seem most likely
to occur overall in typically liberal states like California and New
York. This could be because conservative laws from conservative states
are too far to the right for the Supreme Court, resulting in liberal
victories, and vice versa in the liberal states.

## Issue Area

The last variable I wanted to look at was issue area, because I wanted
to see if some states had a tendency to turn up cases in a particular
issue area (for example, perhaps, Alabama and Civil Rights).

![](supreme_files/figure-gfm/fifty%20issue%20pt%202-1.png)<!-- -->

According to the bar graph, a vast plurality of cases seem to relate to
issues concerning criminal procedure, with civil rights coming in a far
second and the First Amendment a close third. Cases concerning
attorneys, federal taxation, interstate relations, privacy, and unions
are all very rare.

![](supreme_files/figure-gfm/ten%20issue%20pt%202-1.png)<!-- -->

In every state, criminal procedure cases seem to make up the plurality
of the cases sourced to the Supreme Court. The only exception seems to
be Washington, whose criminal procedure cases are roughly equal with its
civil rights cases. In terms of second place, that seems to vary by
state. In California, Louisiana, Georgia, and Alabama, civil rights
seems to be the second most prevelant issue. In New York, Illinois, and
Ohio, the second most prevalent issue is the First Amendment, especially
in New York. Like with the first graph, cases concerning attorneys,
federal taxation, interstate relations, privacy, and unions are rare or
even nonexistent in the last 50-60 years.

## Conclusions

There do not seem to be any definitive indicators for a state court case
becoming a Supreme Court case. While the individual states seem to
emulate major trends displayed in the graph representing all 50 states
(such as the recent dip in conservative wins and the tendency to focus
on criminal procedure cases), there are no consistent trends that can be
used to definitively point to a relationship between states and the
cases sourced from their state courts to the Supreme Court.

## Session Info

``` r
devtools::session_info()
```

    ## ─ Session info ───────────────────────────────────────────────────────────────
    ##  setting  value                               
    ##  version  R version 4.0.1 (2020-06-06)        
    ##  os       Red Hat Enterprise Linux 8.2 (Ootpa)
    ##  system   x86_64, linux-gnu                   
    ##  ui       X11                                 
    ##  language (EN)                                
    ##  collate  en_US.UTF-8                         
    ##  ctype    en_US.UTF-8                         
    ##  tz       America/Chicago                     
    ##  date     2020-07-13                          
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package     * version date       lib source        
    ##  assertthat    0.2.1   2019-03-21 [2] CRAN (R 4.0.1)
    ##  backports     1.1.8   2020-06-17 [2] CRAN (R 4.0.1)
    ##  blob          1.2.1   2020-01-20 [2] CRAN (R 4.0.1)
    ##  broom         0.5.6   2020-04-20 [2] CRAN (R 4.0.1)
    ##  callr         3.4.3   2020-03-28 [2] CRAN (R 4.0.1)
    ##  cellranger    1.1.0   2016-07-27 [2] CRAN (R 4.0.1)
    ##  cli           2.0.2   2020-02-28 [2] CRAN (R 4.0.1)
    ##  colorspace    1.4-1   2019-03-18 [2] CRAN (R 4.0.1)
    ##  crayon        1.3.4   2017-09-16 [2] CRAN (R 4.0.1)
    ##  DBI           1.1.0   2019-12-15 [2] CRAN (R 4.0.1)
    ##  dbplyr        1.4.4   2020-05-27 [2] CRAN (R 4.0.1)
    ##  desc          1.2.0   2018-05-01 [2] CRAN (R 4.0.1)
    ##  devtools      2.3.0   2020-04-10 [2] CRAN (R 4.0.1)
    ##  digest        0.6.25  2020-02-23 [2] CRAN (R 4.0.1)
    ##  dplyr       * 1.0.0   2020-05-29 [2] CRAN (R 4.0.1)
    ##  ellipsis      0.3.1   2020-05-15 [2] CRAN (R 4.0.1)
    ##  evaluate      0.14    2019-05-28 [2] CRAN (R 4.0.1)
    ##  fansi         0.4.1   2020-01-08 [2] CRAN (R 4.0.1)
    ##  farver        2.0.3   2020-01-16 [2] CRAN (R 4.0.1)
    ##  forcats     * 0.5.0   2020-03-01 [2] CRAN (R 4.0.1)
    ##  fs            1.4.1   2020-04-04 [2] CRAN (R 4.0.1)
    ##  generics      0.0.2   2018-11-29 [2] CRAN (R 4.0.1)
    ##  ggplot2     * 3.3.1   2020-05-28 [2] CRAN (R 4.0.1)
    ##  glue          1.4.1   2020-05-13 [2] CRAN (R 4.0.1)
    ##  gtable        0.3.0   2019-03-25 [2] CRAN (R 4.0.1)
    ##  haven         2.3.1   2020-06-01 [2] CRAN (R 4.0.1)
    ##  here          0.1     2017-05-28 [2] CRAN (R 4.0.1)
    ##  highr         0.8     2019-03-20 [2] CRAN (R 4.0.1)
    ##  hms           0.5.3   2020-01-08 [2] CRAN (R 4.0.1)
    ##  htmltools     0.4.0   2019-10-04 [2] CRAN (R 4.0.1)
    ##  httr          1.4.1   2019-08-05 [2] CRAN (R 4.0.1)
    ##  jsonlite      1.6.1   2020-02-02 [2] CRAN (R 4.0.1)
    ##  knitr         1.28    2020-02-06 [2] CRAN (R 4.0.1)
    ##  labeling      0.3     2014-08-23 [2] CRAN (R 4.0.1)
    ##  lattice       0.20-41 2020-04-02 [2] CRAN (R 4.0.1)
    ##  lifecycle     0.2.0   2020-03-06 [2] CRAN (R 4.0.1)
    ##  lubridate     1.7.9   2020-06-08 [2] CRAN (R 4.0.1)
    ##  magrittr      1.5     2014-11-22 [2] CRAN (R 4.0.1)
    ##  memoise       1.1.0   2017-04-21 [2] CRAN (R 4.0.1)
    ##  modelr        0.1.8   2020-05-19 [2] CRAN (R 4.0.1)
    ##  munsell       0.5.0   2018-06-12 [2] CRAN (R 4.0.1)
    ##  nlme          3.1-148 2020-05-24 [2] CRAN (R 4.0.1)
    ##  pillar        1.4.4   2020-05-05 [2] CRAN (R 4.0.1)
    ##  pkgbuild      1.0.8   2020-05-07 [2] CRAN (R 4.0.1)
    ##  pkgconfig     2.0.3   2019-09-22 [2] CRAN (R 4.0.1)
    ##  pkgload       1.1.0   2020-05-29 [2] CRAN (R 4.0.1)
    ##  plyr          1.8.6   2020-03-03 [2] CRAN (R 4.0.1)
    ##  prettyunits   1.1.1   2020-01-24 [2] CRAN (R 4.0.1)
    ##  processx      3.4.2   2020-02-09 [2] CRAN (R 4.0.1)
    ##  ps            1.3.3   2020-05-08 [2] CRAN (R 4.0.1)
    ##  purrr       * 0.3.4   2020-04-17 [2] CRAN (R 4.0.1)
    ##  R6            2.4.1   2019-11-12 [2] CRAN (R 4.0.1)
    ##  Rcpp          1.0.4.6 2020-04-09 [2] CRAN (R 4.0.1)
    ##  readr       * 1.3.1   2018-12-21 [2] CRAN (R 4.0.1)
    ##  readxl        1.3.1   2019-03-13 [2] CRAN (R 4.0.1)
    ##  remotes       2.1.1   2020-02-15 [2] CRAN (R 4.0.1)
    ##  reprex        0.3.0   2019-05-16 [1] CRAN (R 4.0.1)
    ##  rlang         0.4.6   2020-05-02 [2] CRAN (R 4.0.1)
    ##  rmarkdown     2.2     2020-05-31 [2] CRAN (R 4.0.1)
    ##  rprojroot     1.3-2   2018-01-03 [2] CRAN (R 4.0.1)
    ##  rstudioapi    0.11    2020-02-07 [2] CRAN (R 4.0.1)
    ##  rvest         0.3.5   2019-11-08 [2] CRAN (R 4.0.1)
    ##  scales        1.1.1   2020-05-11 [2] CRAN (R 4.0.1)
    ##  sessioninfo   1.1.1   2018-11-05 [2] CRAN (R 4.0.1)
    ##  stringi       1.4.6   2020-02-17 [2] CRAN (R 4.0.1)
    ##  stringr     * 1.4.0   2019-02-10 [2] CRAN (R 4.0.1)
    ##  testthat      2.3.2   2020-03-02 [2] CRAN (R 4.0.1)
    ##  tibble      * 3.0.1   2020-04-20 [2] CRAN (R 4.0.1)
    ##  tidyr       * 1.1.0   2020-05-20 [2] CRAN (R 4.0.1)
    ##  tidyselect    1.1.0   2020-05-11 [2] CRAN (R 4.0.1)
    ##  tidyverse   * 1.3.0   2019-11-21 [2] CRAN (R 4.0.1)
    ##  usethis       1.6.1   2020-04-29 [2] CRAN (R 4.0.1)
    ##  vctrs         0.3.1   2020-06-05 [2] CRAN (R 4.0.1)
    ##  withr         2.2.0   2020-04-20 [2] CRAN (R 4.0.1)
    ##  xfun          0.14    2020-05-20 [2] CRAN (R 4.0.1)
    ##  xml2          1.3.2   2020-04-23 [2] CRAN (R 4.0.1)
    ##  yaml          2.2.1   2020-02-01 [2] CRAN (R 4.0.1)
    ## 
    ## [1] /home/gmeyers1/R/x86_64-pc-linux-gnu-library/4.0
    ## [2] /opt/R/4.0.1/lib/R/library
