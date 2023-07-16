library(ggplot2)

plot <-
  ggplot(mtcars,aes(hp,drat))+
  geom_point()

test_that("Wrong length", {

  expect_error(
    object = plot + plt_identity_line(color = c("red","blue"))
  )

  expect_error(
    object = plot + plt_identity_line(linetype = c("dotted","dashed"))
  )

  expect_error(
    object = plot + plt_identity_line(linewidth =  c(1,2))
  )

})

test_that("Wrong type", {

  expect_error(
    object = plot + plt_identity_line(color = 1)
  )

  expect_error(
    object = plot + plt_identity_line(linetype = 1)
  )

  expect_error(
    object = plot + plt_identity_line(linewidth =  "color")
  )

})
