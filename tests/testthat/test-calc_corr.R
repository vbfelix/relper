test_that("Expect equal", {

  expect_equal(
    object = calc_corr(x = 1:3,y = 1:3),
    expected = structure(list(pearson = c(cor = 1), kendall = c(tau = 1), spearman = c(rho = 1)),
                        row.names = c(NA,-1L), class = c("tbl_df", "tbl", "data.frame")))

})


test_that("Wrong type", {

  expect_error(calc_corr(x = "a"))

  expect_error(calc_corr(y = "a"))

})

test_that("Wrong length", {

  expect_error(calc_corr(x = 1:3, y = 1:4))

  expect_error(calc_corr(x = 1:2, y = 1:2))

})

