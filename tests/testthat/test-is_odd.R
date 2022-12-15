test_that("results", {

  expect_equal(
    object = is_odd(1),
    expected = TRUE
  )
  expect_equal(
    object = is_odd(2),
    expected = FALSE
  )
  expect_equal(
    object = is_odd(1.1),
    expected = TRUE
  )
  expect_equal(
    object = is_odd(1.10),
    expected = TRUE
  )
  expect_equal(
    object = is_odd(2.2),
    expected = FALSE
  )

})

test_that("warning", {


})

test_that("error", {

  expect_error(is_odd(x = "a"))

})
