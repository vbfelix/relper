test_that("results", {

  expect_equal(
    object = format_digit(x = 2),
    expected = "02"
  )

  expect_equal(
    object = format_digit(x = 2,digits = 3),
    expected = "002"
  )

})

test_that("Wrong type", {

  expect_error(format_digit(x = 2,digits = "a"))

  expect_error(format_digit(x = 2,digits = 2.2))

})
