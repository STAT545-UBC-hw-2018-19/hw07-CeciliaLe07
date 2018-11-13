
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/vincenzocoia/powers.svg?branch=master)](https://travis-ci.org/vincenzocoia/powers)

**Note**: This R package is not mean to be "serious". It's just for teaching purposes.

powers
======

This is an R package that gives `sqrt()` friends by providing other power functions. Moreover, you this package allow you to perform a *boxcox* transformation to linear model fitted by `lm()`.

Installation
------------

You can install powers from github with:

``` r
# install.packages("devtools")
devtools::install_github("vincenzocoia/powers")
```

Example
-------

See the vignette for more extensive use, but here are some examples:

``` r
powers::reciprocal(2)
#> [1] 0.5
```

``` r
powers::cube(10)
#> [1] 1000
```

``` r
set.seed(548)
y <- rpois(20,5)
x <- rnorm(20)
powers::apply_boxcox(lm(y~x))
#> $lambda
#> [1] 0.9
#> 
#> $transformed_response
#>        1        2        3        4        5        6        7        8 
#> 3.391431 3.294937 4.317507 1.313967 2.305113 4.345730 6.173241 4.433476 
#>        9       10       11       12       13       14       15       16 
#> 3.144697 6.294562 3.965354 5.270318 8.215813 3.284270 7.299171 2.370646 
#>       17       18       19       20 
#> 6.086735 4.275543 0.233568 4.321286
```

For Developers
--------------

(Again, I don't actually intend for anyone to develop this silly package, but if I did, here's what I'd write.)

Use the internal `pow` function as the machinery for the front-end functions such as `square`, `cube`, and `reciprocal`.
