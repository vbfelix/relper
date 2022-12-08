test_that("error", {
  expect_error(as_perc(x = "a"))
  expect_error(as_perc(y = "a"))
  expect_error(as_perc(x = 1,y = c(1,2)))
  expect_error(as_perc(x = 1,y = 1))
})
