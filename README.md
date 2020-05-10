
<!-- README.md is generated from README.Rmd. Please edit that file -->

# relper

The goal of relper is to provide miscellaneous functions to assist in
data cleaning and preparation

## Installation

You can install the developer version of relper with:

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
set.seed(123)
x <- rexp(20,.5)

x
#>  [1] 1.68691452 1.15322054 2.65810974 0.06315472 0.11242195 0.63300243
#>  [7] 0.62845458 0.29053361 5.45247293 0.05830689 2.00966012 0.96042946
#> [13] 0.56202726 0.75423566 0.37656808 1.69957226 3.12640708 0.95752083
#> [19] 1.18186967 8.08202342
```

### Coefficient of Variation (CV)

``` r

#raw
cv(x, perc = F)
#> [1] 1.228836

#%
cv(x, perc = T)
#> [1] 122.8836
```

### Harmonic mean

``` r

harmonic_mean(x)
#> [1] 0.3293037
```

## Others

### Area under the curve

``` r
x <- seq(-3,3,l = 100)
y <- dnorm(x)
plot(x,y)
```

<img src="man/figures/README-aux example-1.png" width="100%" />

``` r
auc(x,y)
#> [1] 0.9972835
```
