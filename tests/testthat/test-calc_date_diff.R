date1 <- lubridate::dmy("01/05/1998")

date2 <- lubridate::dmy("21/11/2018")

test_that("results", {

  expect_equal(
    object = calc_date_diff(date1,date2),
    expected = 7509
  )

  expect_equal(
    object = calc_date_diff(date1,date2,add = 1),
    expected = 7510
  )

  expect_equal(
    object = calc_date_diff(date1,date2,unit = "hours"),
    expected = 7509*24
  )

})


test_that("error", {

  expect_error(calc_date_diff(date1 = "a",date2 = "b"))
  expect_error(calc_date_diff(date1 = date1,date2 = "b"))
  expect_error(calc_date_diff(date1 = "a",date2 = date2))
  expect_error(calc_date_diff(date1 = date1,date2 = date2,unit = "a"))
  expect_error(calc_date_diff(date1 = date1,date2 = date2,unit = 1))
  expect_error(calc_date_diff(date1 = date1,date2 = date2,add = "a"))

})
