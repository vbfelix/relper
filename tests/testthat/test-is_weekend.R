#friday
date1 <- lubridate::dmy("20/01/2023")
datetime1 <- lubridate::dmy_hms("20/01/2023 10:00:00")

#saturday
date2 <- lubridate::dmy("21/01/2023")
datetime2 <- lubridate::dmy_hms("21/01/2023 10:00:00")


test_that("Expect TRUE", {

  expect_true(is_weekend(x = date2))
  expect_true(is_weekend(x = datetime2))

})

test_that("Expect FALSE", {

  expect_false(is_weekend(x = date1))

  expect_false(is_weekend(x = datetime1))

})

test_that("Wrong type", {

  expect_error(is_weekend(x = 1))

  expect_error(is_weekend(x = "a"))

  expect_error(is_weekend(x = TRUE))


})

