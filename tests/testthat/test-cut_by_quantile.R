test_that("Expect equal", {

  expect_equal(
    object = cut_by_quantile(x = 1:3,q = 0:1),
    expected = structure(c(1L, 1L, 1L), .Label = "[1,3]", class = "factor")
  )

})

test_that("Wrong type", {

  expect_error(cut_by_quantile(x = "a",q = 1))
  expect_error(cut_by_quantile(x = 1,q = "a"))
  expect_error(cut_by_quantile(x = 1,q = 1))
  expect_error(cut_by_quantile(x = 1,q = seq(0,1,.1)))
  expect_error(cut_by_quantile(x = 1:10,q = 1:10))

})

test_that("Wrong Length", {

  expect_error(cut_by_quantile(x = 1,q = 1))

})

test_that("Argument outbound", {

  expect_error(cut_by_quantile(x = 1,q = seq(0,1,.1)))

  expect_error(cut_by_quantile(x = 1:10,q = 1:10))

})



