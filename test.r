library(tidyverse)
library(relper)

# df_summary --------------------------------------------------------------

mtcars %>% df_summary()

iris %>% df_summary()

# dual_plot ---------------------------------------------------------------

set.seed(123);x <- seq(0,1,l = 100);y <- cumsum(rnorm(100));z <- y^2 - rnorm(100)

data <- tibble(d = seq(as.Date("2000/1/1"), by = "day", length.out = 100),x,y,z)
?seq.Date()
data %>% summary()

dual_plot(data,"x","y","z")

dual_plot(data,"x","y","z",y_breaks = seq(-2,10,.5))

dual_plot(data,"d","y","z")

# r_pearson ---------------------------------------------------------------

r_pearson(n = 25,p_sim = -.3,tol = .1)
