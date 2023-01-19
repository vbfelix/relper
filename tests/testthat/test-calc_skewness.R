set.seed(123);x <- rnorm(10)


test_that("Expect equal", {

  expect_equal(
    object = calc_skewness(x = x,type = "fisher_pearson"),
    expected = 0.515143427194839
  )

})

test_that("Wrong type", {

  expect_error(calc_skewness(x = "a"))

  expect_error(calc_skewness(x = TRUE))

  expect_error(calc_skewness(x = x,type = 1))

  expect_error(calc_skewness(x = x,type = TRUE))

})

test_that("Invalid option", {

  expect_error(calc_skewness(x = x,type = "a"))

})
