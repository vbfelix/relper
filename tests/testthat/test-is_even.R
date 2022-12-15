test_that("results", {

  expect_equal(
    object = is_even(1),
    expected = FALSE
  )
  expect_equal(
    object = is_even(2),
    expected = TRUE
  )
  expect_equal(
    object = is_even(1.1),
    expected = FALSE
  )
  expect_equal(
    object = is_even(1.10),
    expected = FALSE
  )
  expect_equal(
    object = is_even(2.2),
    expected = TRUE
  )

})

test_that("warning", {


})

test_that("error", {

  expect_error(is_even(x = "a"))

})
