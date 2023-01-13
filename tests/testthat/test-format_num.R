test_that("results", {

  expect_equal(
    object = format_num(1),
    expected = "1.00"
  )

  expect_equal(
    object = format_num(1000),
    expected = "1,000.00"
  )

  expect_equal(
    object = format_num(1000,br_mark = TRUE),
    expected = "1.000,00"
  )

})

test_that("error", {

  expect_error(format_num("a"))

  expect_error(format_num(1,digits = "a"))

  expect_error(format_num(1,decimal_mark = 2))

  expect_error(format_num(1,thousand_mark = 2))

  expect_error(format_num(1,br_mark = 2))

  expect_error(format_num(1,br_mark = "a"))

})
