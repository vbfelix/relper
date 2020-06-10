library(tidyverse)
library(relper)

# df_summary --------------------------------------------------------------

mtcars %>% df_summary()

iris %>% df_summary()

# dual_plot ---------------------------------------------------------------

n <- 10

set.seed(123);x <- seq(0,1,l = n);y <- 1:n;z <- y ^2 + rnorm(n)

data <- tibble(d = seq(as.Date("2000/1/1"), by = "day", length.out = n),
               x1 = x,
               y1 = y,
               y2 = z)

data %>% summary()

dual_plot(data,"x1","y1","y2")

dual_plot(data,"x1","y1","y2",y_breaks = seq(-2,10,.5))

dual_plot(data,"d","y1","y2")

  #spline approx
plot(spline(y,z,n = n)$y,z)

data %>%
  mutate(y3 = scale01(y2,min(y),max(y)),
         y4 = spline(y2,y1,n = n,method = "hyman")$y)


# r_pearson ---------------------------------------------------------------

r_pearson(n = 25,p_sim = -.3,tol = .1)
