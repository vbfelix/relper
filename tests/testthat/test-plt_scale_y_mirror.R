library(ggplot2)

plot <-
  ggplot(mtcars,aes(hp,drat))+
  geom_point()

test_that("Wrong length", {

  expect_error(
    object = plot + plt_scale_y_mirror(breaks = c(20,30),labels = c(20))
    )

  expect_error(
    object = plot + plt_scale_y_mirror(breaks = 2,labels = 2,expand = 1:3)
    )

})
