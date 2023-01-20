
test_that("Wrong type", {

  expect_error(calc_kurtosis(x = "a"))

  expect_error(calc_kurtosis(x = TRUE))

  expect_error(calc_kurtosis(x = x,type = 1))

  expect_error(calc_kurtosis(x = x,type = TRUE))

})

test_that("Invalid option", {

  expect_error(calc_kurtosis(x = x,type = "a"))

})
