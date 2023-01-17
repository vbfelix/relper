test_that("Expect equal", {

  expect_equal(
    object = format_p_value(p_value = 1),
    expected = "1.0000"
  )

  expect_equal(
    object = format_p_value(p_value = 1,lower_bound = 5),
    expected = "<5"
  )

})

test_that("Wrong type", {

  expect_error(format_p_value(p_value = "a"))

  expect_error(format_p_value(p_value = 1,lower_bound =  "a"))

})

test_that("Wrong length", {

  expect_error(format_p_value(p_value = 1,lower_bound = c(1,2)))

})
