test_that("Expect equal", {

  expect_equal(
    object = format_num(x = .1),
    expected = "0.10"
  )

  expect_equal(
    object = format_num(x = 1),
    expected = "1.00"
  )

  expect_equal(
    object = format_num(x = 1000),
    expected = "1,000.00"
  )

  expect_equal(
    object = format_num(x = 1000,br_mark = TRUE),
    expected = "1.000,00"
  )

  expect_equal(
    object = format_num(x = 1000.5,br_mark = TRUE),
    expected = "1.000,50"
  )

})

test_that("Wrong type", {

  expect_error(format_num(x = "a"))

  expect_error(format_num(x = 1,digits = "a"))

  expect_error(format_num(x = 1,decimal_mark = 2))

  expect_error(format_num(x = 1,thousand_mark = 2))

  expect_error(format_num(x = 1,br_mark = 2))

  expect_error(format_num(x = 1,br_mark = "a"))

})

