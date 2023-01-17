# auxiliar data -----------------------------------------------------------

ccf_xy12 <-
  structure(list(ccf = 1, lag = 0),
            row.names = c(NA, -1L),
            class = c("tbl_df","tbl", "data.frame"))

acf_x1 <-
  structure(list(acf = 1, lag = 0),
            row.names = c(NA, -1L),
            class = c("tbl_df","tbl", "data.frame"))

test_that("Expected equal", {

  expect_equal(
    object = calc_acf(x = 1:2,y = 1:2),
    expected = ccf_xy12
  )

  expect_equal(
    object = calc_acf(x = 1),
    expected = acf_x1
  )

})


test_that("Error by wrong type", {

  expect_error(object = calc_acf(x = "a"))

  expect_error(object = calc_acf(y = "a"))

})

test_that("Error by wrong length", {

  expect_error(object = calc_acf(x = 1:2,y = 1:3))

  expect_error(object = calc_acf(x = 1,y = 1))
})
