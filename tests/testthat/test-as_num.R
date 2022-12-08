test_that("results", {
  expect_equal(as_num(x = "1.000"), 1000)
  expect_equal(as_num(x = "1.000,20"), 1000.2)
  expect_equal(as_num(x = "0,20"), .2)

})

test_that("warning", {
  expect_warning(as_num(x = "a"))

})
