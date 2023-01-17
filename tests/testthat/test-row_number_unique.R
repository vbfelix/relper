test_that("results", {
  expect_equal(
    object = row_number_unique(c("a","a","b")),
    expected =  c(1L, 1L, 2L))
})

