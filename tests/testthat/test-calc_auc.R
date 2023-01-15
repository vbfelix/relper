test_that("results", {
  expect_equal(calc_auc(x = 1:5,y = rep(2,5)), 8)
  expect_equal(calc_auc(x = 1:5,y = rep(2,5),limits = c(1,4)), 6)
})


test_that("error", {
  expect_error(calc_auc(x = "a"))
  expect_error(calc_auc(y = "a"))
  expect_error(calc_auc(limits = "a"))
  expect_error(calc_auc(limits = 1))
  expect_error(calc_auc(limits = 1:3))


})
