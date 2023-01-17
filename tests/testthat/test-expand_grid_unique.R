test_that("Expect equal", {

  expect_equal(
    object = expand_grid_unique(1:2,1:2),
    expected = structure(list(V1 = 1L, V2 = 2L),
                         row.names = c(NA, -1L),
                         class = c("tbl_df","tbl", "data.frame"))
  )

  expect_equal(
    object = expand_grid_unique(1:2,1:2,include_equals = TRUE),
    expected = structure(list(V1 = c(1L, 1L, 2L),
                              V2 = c(1L, 2L, 2L)),
                         row.names = c(NA, -3L),
                         class = c("tbl_df", "tbl", "data.frame"))
  )

})

test_that("Wrong type", {

  expect_error(expand_grid_unique(x = 1:2,y = 1:2,include_equals = 1))

  expect_error(expand_grid_unique(x = 1:2,y = 1:2,include_equals = 'a'))

})
