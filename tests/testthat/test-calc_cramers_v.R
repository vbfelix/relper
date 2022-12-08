test_that("results", {

  expect_equal(
    object = calc_cramers_v(chisq.test(matrix(c(12, 5, 7, 7), ncol = 2))),
    expected = 0.143809939973993
    )

})


test_that("error", {

  expect_error(calc_cramers_v(chi_square = "a"))
  expect_error(calc_cramers_v(chi_square = 1))
  expect_error(calc_cramers_v(chi_square = T))

})
