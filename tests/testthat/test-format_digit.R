test_that("results", {

  expect_equal(
    object = format_digit(2),
    expected = "02"
  )

  expect_equal(
    object = format_digit(2,digits = 3),
    expected = "002"
  )

})

test_that("warning", {


})

test_that("error", {

  expect_error(format_digit(2,digits = "a"))

})
