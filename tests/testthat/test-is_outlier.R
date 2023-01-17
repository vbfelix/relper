test_that("Expect equal", {

  expect_equal(
    object = is_outlier(1:5),
    expected = c(FALSE, FALSE, FALSE, FALSE, FALSE)
  )

})

test_that("Wrong type", {

  expect_error(is_outlier(x = "a"))

  expect_error(is_outlier(x = TRUE))
})
