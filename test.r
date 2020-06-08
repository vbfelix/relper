library(tidyverse)
library(relper)


# df_summary --------------------------------------------------------------

mtcars %>% df_summary()

iris %>% df_summary()

# dual_plot ---------------------------------------------------------------

set.seed(123);x <- seq(0,1,l = 100);y <- cumsum(rnorm(100));z <- y^2 - rnorm(100)

data <- tibble(x,y,z)

dual_plot(data,"x","y","z")

dual_plot(data,"x","y","z",y_breaks = seq(-5,11,1))

# r_pearson ---------------------------------------------------------------

r_pearson(n = 25,p_sim = -.3,tol = .1)
