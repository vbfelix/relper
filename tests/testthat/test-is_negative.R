test_that("results", {

  expect_equal(
    object = is_negative(1),
    expected = FALSE
  )
  expect_equal(
    object = is_negative(-2),
    expected = TRUE
  )

})

test_that("error", {

  expect_error(is_negative(x = "a"))

})
