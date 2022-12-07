test_that("results", {
  expect_equal(as_perc(x = 1), 100)
  expect_equal(as_perc(x = c(1,2)), c(100,200))
  expect_equal(as_perc(x = c(1,4), sum = TRUE), c(20,80))
})

test_that("error", {
  expect_error(as_perc(x = "a"))
  expect_error(as_perc(x = c(1,4), sum = 2))
  expect_error(as_perc(x = c(1,4), sum = "z"))
})
