
<!-- README.md is generated from README.Rmd. Please edit that file -->

# relper

The goal of relper is to provide miscellaneous functions to assist in
data cleaning and visualization.

## Installation

You can install the developer version of relper with:

``` r
remotes::install_github("vbfelix/relper")
```

## ggplot2 functions

``` r
library(ggplot2)

plot <- 
ggplot(mtcars,aes(drat,hp))+
  geom_point()

plot
```

<img src="man/figures/README-example-1.png" width="40%" />

### theme\_x

``` r
plot + theme_x()
```

<img src="man/figures/README-unnamed-chunk-1-1.png" width="40%" />

### theme\_y

``` r
plot + theme_y()
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="40%" />

### theme\_map

``` r
plot + theme_map()
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="40%" />

### flip\_y\_title

``` r
plot + flip_y_title
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="40%" />

### water\_mark

``` r
url <- "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/1200px-R_logo.svg.png"

logo <- water_mark(url, local_file = F)

plot + annotation_custom(logo)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="40%" />

``` r

plot + annotation_custom(logo, xmin = 4.75, xmax = 5, ymin = 315, ymax = 335)
```

<img src="man/figures/README-unnamed-chunk-5-2.png" width="40%" />

## Metrics

``` r
x <- rexp(20,.5)

x
#>  [1] 3.37028277 0.10978208 0.15126045 4.40741212 0.49822440 1.99523089
#>  [7] 0.01971827 3.48182780 4.96428696 0.51453678 0.05946686 1.48674663
#> [13] 1.62719588 4.52893921 0.26444873 0.57534021 0.13733641 1.22902808
#> [19] 2.48941303 4.57123634
```

### Coefficient of Variation (CV)

``` r
#raw
cv(x, perc = F)
#> [1] 0.9736563

#%
cv(x, perc = T)
#> [1] 97.36563
```

### Mean’s

``` r
num_mean(x)
#> # A tibble: 1 x 3
#>   arithmetic geometric harmonic
#>        <dbl>     <dbl>    <dbl>
#> 1       1.82     0.786    0.191
```

#### Harmonic mean

``` r
harmonic_mean(x)
#> [1] 0.1914652
```

#### Geometric mean

``` r
geometric_mean(x)
#> [1] 0.7864269
```

### Numeric univariate summary statistics

``` r
num_summary(x)
#> # A tibble: 1 x 13
#>       n    na outlier negative equal_zero positive    min   p25   p50   p75
#>   <int> <int>   <int>    <int>      <int>    <int>  <dbl> <dbl> <dbl> <dbl>
#> 1    20     0       0        0          0       20 0.0197 0.236  1.36  3.40
#> # … with 3 more variables: max <dbl>, mean <dbl>, cv <dbl>
```

### Correlations

``` r
y <- rnorm(20)

num_corr(x,y)
#> # A tibble: 1 x 3
#>   pearson kendall spearman
#>     <dbl>   <dbl>    <dbl>
#> 1  -0.166 -0.0947  -0.0962
```

## Others

### Area under the curve

``` r
x <- seq(-3,3,l = 100)

y <- dnorm(x)

plot(x,y)
```

<img src="man/figures/README-aux example-1.png" width="40%" />

``` r
#from min to max of x
range(x)
#> [1] -3  3

auc(x,y)
#> [1] 0.9972835

#from -2 to 2
auc(x,y,limits = c(-2,2))
#> [1] 0.9544345

#from -1 to 1
auc(x,y,limits = c(-1,1))
#> [1] 0.6825416
```
