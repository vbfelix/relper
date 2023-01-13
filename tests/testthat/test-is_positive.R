test_that("results", {

  expect_equal(
    object = is_positive(1),
    expected = TRUE
  )
  expect_equal(
    object = is_positive(-2),
    expected = FALSE
  )

})

test_that("error", {

  expect_error(is_positive(x = "a"))

})
