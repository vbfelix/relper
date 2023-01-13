test_that("results", {
  expect_equal(row_number_unique(c("a","a","b")), c(1L, 1L, 2L))

})

