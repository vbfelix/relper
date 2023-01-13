test_that("results", {

  expect_equal(
    object = calc_peak_density(1:2),
    expected = 1.00685002093889
  )

})


test_that("error", {

  expect_error(calc_peak_density("a"))
  expect_error(calc_peak_density(1))


})
