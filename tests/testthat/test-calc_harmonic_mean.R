
test_that("results", {

  expect_equal(
    object = calc_harmonic_mean(1:10),
    expected = 3.41417152147406
  )

})

test_that("warning", {

  expect_warning(calc_harmonic_mean(0))

})

test_that("error", {

  expect_error(calc_harmonic_mean("a"))

})
