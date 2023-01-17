test_that("Expect equal", {

  expect_equal(
    object = calc_harmonic_mean(x = 1:10),
    expected = 3.41417152147406
  )

})

test_that("Value = 0", {

  expect_warning(calc_harmonic_mean(x = 0))

})

test_that("Wrong type", {

  expect_error(calc_harmonic_mean(x = "a"))

  expect_error(calc_harmonic_mean(x = TRUE))

})
