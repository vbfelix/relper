
test_that("results", {

  expect_equal(
    object = calc_mean(1:3),
    expected = structure(list(arithmetic = 2, geometric = 1.81712059283214,
                              harmonic = 1.63636363636364),
                         row.names = c(NA, -1L),
                         class = c("tbl_df","tbl", "data.frame"))
  )

})


test_that("error", {

  expect_error(calc_mean("a"))

})
