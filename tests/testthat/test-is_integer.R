test_that("results", {

  expect_equal(
    object = is_integer(1),
    expected = TRUE
  )
  expect_equal(
    object = is_integer(1.1),
    expected = FALSE
  )

})

test_that("warning", {


})

test_that("error", {

  expect_error(is_integer(x = "a"))

})
