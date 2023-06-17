
test_that("Wrong type", {

  expect_error(calc_error(x = "a"))

  expect_error(calc_error(y = "a"))

})

test_that("Wrong length", {

  expect_error(calc_error(x = 1:3, y = 1:4))

  expect_error(calc_error(x = 1:2, y = 1:2))

})

