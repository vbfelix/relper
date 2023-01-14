test_that("results", {

  expect_equal(
    object = format_p_value(p_value = 1),
    expected = "1.0000"
  )

  expect_equal(
    object = format_p_value(1,5),
    expected = "<5"
  )

})

test_that("error", {

  expect_error(format_p_value("a"))

  expect_error(format_p_value(1,p_value_min = "a"))

})
