test_that("results", {


})

test_that("warning", {


})

test_that("error", {

  expect_error(calc_date_aux(df = "a"))
  expect_error(calc_date_aux(df = 1))

})
