test_that("results", {

  expect_equal(
    object = calc_cv(1),
    expected = NA_real_
  )
  expect_equal(
    object = calc_cv(1:3,as_perc = FALSE),
    expected = .5
  )
  expect_equal(
    object = calc_cv(1:3,as_perc = TRUE),
    expected = 50
  )

})

test_that("warning", {

  expect_warning(calc_cv(x = -1:1))

})

test_that("error", {

  expect_error(calc_cv(x = "a"))
  expect_error(calc_cv(x = 1:3,as_perc = "a"))

})
