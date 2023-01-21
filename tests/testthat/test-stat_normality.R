test_that("Wrong type", {

  #x
  expect_error(object = stat_normality(x = "a"))

  expect_error(object = stat_normality(x = TRUE))

  #alpha
  expect_error(object = stat_normality(x = 1:5,alpha = "a"))

  expect_error(object = stat_normality(x = 1:5,alpha = TRUE))

  #digits

  expect_error(object = stat_normality(x = 1:5,digits = "a"))

  expect_error(object = stat_normality(x = 1:5,digits = TRUE))

  expect_error(object = stat_normality(x = 1:5,digits = 2.2))

  #print
  expect_error(object = stat_normality(x = 1:5,print = "a"))

  expect_error(object = stat_normality(x = 1:5,print = 2))

})

test_that("Wrong length", {

  #X
  expect_error(object = stat_normality(x = 1:7))

  #alpha
  expect_error(object = stat_normality(x = 1:8,alpha = c(.5,.6)))

  #print
  expect_error(object = stat_normality(x = 1:8,print = c(TRUE, FALSE)))

})

test_that("Wrong range", {

  expect_error(object = stat_normality(x = 1:8,alpha = 2))

})
