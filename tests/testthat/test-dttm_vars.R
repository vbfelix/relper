test_that("Wrong type", {

  expect_error(dttm_vars(df = "a"))

  expect_error(dttm_vars(df = 1))

})
