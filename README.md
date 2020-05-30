
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

### calendar data and plot (from ggcal)

``` r
library(tidyverse)

date <- seq(as.Date("2016-01-01"), as.Date("2016-02-29"),by = "1 day")

#data
df <-
  tibble(dates = rep(date, 3),
         value = num_format(rnorm(3*length(date)),0),
         grp = rep(c("A","B","C"), each = length(date))) %>%
  nest(-grp) %>%
  mutate(aux = map(data,~cal_data(.$dates,.$value))) %>%
  select(-data) %>%
  unnest() 

head(df)
#> # A tibble: 6 x 9
#>   grp   date       fill      x month    year monlabel     y wday 
#>   <chr> <date>     <chr> <dbl> <ord>   <dbl> <fct>    <dbl> <ord>
#> 1 A     2016-01-01 2         5 janeiro  2016 Janeiro     10 Sex  
#> 2 A     2016-01-02 -1        6 janeiro  2016 Janeiro     10 Sáb  
#> 3 A     2016-01-03 2         0 janeiro  2016 Janeiro      9 Dom  
#> 4 A     2016-01-04 -1        1 janeiro  2016 Janeiro      9 Seg  
#> 5 A     2016-01-05 -1        2 janeiro  2016 Janeiro      9 Ter  
#> 6 A     2016-01-06 -1        3 janeiro  2016 Janeiro      9 Qua

df %>% 
  cal_plot(facet = grp)+
  scale_fill_viridis_d()
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="40%" /><img src="man/figures/README-unnamed-chunk-6-2.png" width="40%" />

## Metrics

``` r
x <- rexp(20,.5)

x
#>  [1]  4.9468912  0.9536273  2.1401985  2.3750098  2.0411785 16.3936796
#>  [7]  1.9514829  3.4579760  0.2958318  3.7275977  1.0477038  2.5082797
#> [13]  1.1376070  0.1253181  0.1072748  1.1998363  1.1982097  1.4956783
#> [19]  3.0890104  0.3972946
```

### Coefficient of Variation (CV)

``` r
#raw
cv(x, perc = F)
#> [1] 1.386878

#%
cv(x, perc = T)
#> [1] 138.6878
```

### Mean’s

``` r
num_mean(x)
#> # A tibble: 1 x 3
#>   arithmetic geometric harmonic
#>        <dbl>     <dbl>    <dbl>
#> 1       2.53      1.38    0.628
```

#### Harmonic mean

``` r
harmonic_mean(x)
#> [1] 0.6279183
```

#### Geometric mean

``` r
geometric_mean(x)
#> [1] 1.380637
```

### Numeric univariate summary statistics

``` r
num_summary(x)
#> # A tibble: 1 x 13
#>       n    na outlier negative equal_zero positive   min   p25   p50   p75   max
#>   <int> <int>   <int>    <int>      <int>    <int> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1    20     0       1        0          0       20 0.107  1.02  1.72  2.65  16.4
#> # … with 2 more variables: mean <dbl>, cv <dbl>
```

### Correlations

``` r
y <- rnorm(20)

num_corr(x,y)
#> # A tibble: 1 x 3
#>   pearson kendall spearman
#>     <dbl>   <dbl>    <dbl>
#> 1   0.110 -0.0421  -0.0511
```

## Others

### Scaling

``` r
x <- seq(-3,3,l = 10)

x
#>  [1] -3.0000000 -2.3333333 -1.6666667 -1.0000000 -0.3333333  0.3333333
#>  [7]  1.0000000  1.6666667  2.3333333  3.0000000

y <- scale01(x)

y
#>  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
#>  [8] 0.7777778 0.8888889 1.0000000

plot(x,y)
```

<img src="man/figures/README-unnamed-chunk-14-1.png" width="40%" />

``` r

z <- scale01(x,100)

plot(x,z)
```

<img src="man/figures/README-unnamed-chunk-14-2.png" width="40%" />

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
