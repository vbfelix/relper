test_that("Expect equal", {

  expect_equal(
    object = calc_peak_density(1:2),
    expected = 1.00685002093889
  )

})


test_that("Wrong type", {

  expect_error(calc_peak_density(x = "a"))

})

test_that("Wrong length", {

  expect_error(calc_peak_density(1))

})
