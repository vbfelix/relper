test_that("Wrong type", {

  expect_error(summary_xy(x = "a"))

  expect_error(summary_xy(y = "a"))

})

test_that("Wrong length", {

  expect_error(summary_xy(x = 1:3, y = 1:4))

  expect_error(summary_xy(x = 1:2, y = 1:2))

})

