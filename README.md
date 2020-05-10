
<!-- README.md is generated from README.Rmd. Please edit that file -->

# relper

The goal of relper is to provide miscellaneous functions to assist in
data cleaning and preparation

## Installation

You can install the developer version of relper from
[CRAN](https://CRAN.R-project.org) with:

``` r
remotes::install_github("vbfelix/relper")
```

## ggplot2 functions

This is a basic example which shows you how to solve a common problem:

``` r
library(ggplot2)
plot <- 
ggplot(mtcars,aes(drat,hp))+
  geom_point()

plot
```

<img src="man/figures/README-example-1.png" width="100%" />

### theme\_x

``` r
plot + theme_x()
```

<img src="man/figures/README-unnamed-chunk-1-1.png" width="100%" />

### theme\_y

``` r
plot + theme_y()
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

### theme\_x

``` r
plot + theme_map()
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

## metrics

``` r

x <- rexp(20,.5)

x
#>  [1] 2.4868794 0.4392151 0.6746712 3.7225304 2.3968872 0.1075790 0.1421367
#>  [8] 2.9956407 1.1980031 5.0932069 1.1530218 4.0700921 2.9336107 4.7318863
#> [15] 0.3189925 2.1247582 1.7788290 7.9864627 1.4708594 1.2267898
```

### Coefficient of Variation (CV)

``` r

#raw
cv(x, perc = F)
#> [1] 0.8514989

#%
cv(x, perc = T)
#> [1] 85.14989
```

### Harmonic mean

``` r

harmonic_mean(x)
#> [1] 0.666758
```

## Other

### Area under the curve

``` r
x <- seq(-3,3,l = 100)
y <- dnorm(x)
plot(x,y)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

``` r
auc(x,y)
#> [1] 0.9972835
```
