x <- seq(as.Date("1910/1/1"), as.Date("1911/1/1"), "days")

test_that("Expect equal", {

  expect_equal(
    object = calc_date_range(x),
    expected = "01/01/1910 - 01/01/1911"
  )

})


test_that("Wrong type", {

  expect_error(calc_date_range(x = "a"))

  expect_error(calc_date_range(x = 1))

})
