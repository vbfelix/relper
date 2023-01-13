test_that("results", {

  expect_equal(
    object = is_outlier(1:5),
    expected = c(FALSE, FALSE, FALSE, FALSE, FALSE)
  )

})

test_that("error", {

  expect_error(is_outlier(x = "a"))

})
