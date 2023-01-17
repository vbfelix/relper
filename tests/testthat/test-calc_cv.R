test_that("Expect equal", {

  expect_equal(
    object = calc_cv(1:3,as_perc = FALSE),
    expected = .5
  )
  expect_equal(
    object = calc_cv(1:3,as_perc = TRUE),
    expected = 50
  )

})

test_that("mean = 0", {

  expect_warning(calc_cv(x = -1:1))

})

test_that("Wrong type", {

  expect_error(calc_cv(x = "a"))

  expect_error(calc_cv(x = 1:3,as_perc = "a"))

  expect_error(calc_cv(x = 1:3,as_perc = 1))


})

test_that("Wrong length", {

  expect_error(calc_cv(x = 1))

})
