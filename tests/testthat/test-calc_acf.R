test_that("error", {
  expect_error(calc_acf(x = "a"))
  expect_error(calc_acf(y = "a"))
  expect_error(calc_acf(x = 1,y = c(1,2)))
  expect_error(calc_acf(x = 1,y = 1))
})
