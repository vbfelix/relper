test_that("Wrong type", {

  expect_error(object = summary_num(x = "a"))

  expect_error(object = summary_num(x = TRUE))

  expect_error(object = summary_num(x = 1:2,type = 2))

  expect_error(object = summary_num(x = 1:2,type = "a"))

  expect_error(object = summary_num(x = 1:2,other_means = 2))

  expect_error(object = summary_num(x = 1:2,other_means = "a"))

})


test_that("Wrong length", {

  expect_error(object = summary_num(x = 1))

})
