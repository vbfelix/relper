test_that("Expect equal", {

  expect_equal(
    object = calc_mean(x = 1:10),
    expected = 5.5
  )

  expect_equal(
    object = calc_mean(x = 1:10,'geometric'),
    expected = 4.52872868811677
  )

  expect_equal(
    object = calc_mean(x = 1:10,'harmonic'),
    expected = 3.41417152147406
  )

})

test_that("Value <= 0", {

  expect_warning(calc_mean(x = 0,'geometric'))

  # expect_warning(calc_mean(x = -1))

})

test_that("Wrong type", {

  expect_error(calc_mean(x = "a"))

  expect_error(calc_mean(x = TRUE))

})
