
# Lab3

<!-- badges: start -->
[![R-CMD-check](https://github.com/sjofrem/Lab3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sjofrem/Lab3/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of Lab3 is to create two basic functions

## Installation

You can install the development version of Lab3 from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("sjofrem/Lab3")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Lab3)
wiki_graph <- data.frame(
   v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
   v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
   w =c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
 )
 dijkstra(wiki_graph, 1) # [1] 0 7 9 20 20 11
```

