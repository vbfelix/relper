summary_num_full <-
  structure(list(n = 2L, na = 0L, negative = 0L, equal_zero = 0L,
                 positive = 2L, min = 1L, p25 = c(`25%` = 1.25), p50 = 1.5,
                 p75 = c(`75%` = 1.75), max = 2L, mode = NA_real_, mean = 1.5,
                 cv = 0.47), row.names = c(NA, -1L), class = c("tbl_df", "tbl",
                                                               "data.frame"))
summary_num_minimal <-
  structure(list(n = 2L, min = 1L, p25 = c(`25%` = 1.25), p50 = 1.5,
                 p75 = c(`75%` = 1.75), max = 2L, mode = NA_real_, mean = 1.5,
                 cv = 0.47), row.names = c(NA, -1L), class = c("tbl_df", "tbl",
                                                               "data.frame"))


test_that("Expected equal", {

  expect_equal(
    object = summary_num(x = 1:2),
    expected =  summary_num_full
  )

  expect_equal(
    object = summary_num(x = 1:2,minimal = TRUE),
    expected =  summary_num_minimal
  )

})



test_that("Wrong type", {

  expect_error(object = summary_num(x = "a"))

  expect_error(object = summary_num(x = TRUE))

  expect_error(object = summary_num(x = 1:2,minimal = 2))

  expect_error(object = summary_num(x = 1:2,minimal = "a"))


})


test_that("Wrong length", {

  expect_error(object = summary_num(x = 1))

})
