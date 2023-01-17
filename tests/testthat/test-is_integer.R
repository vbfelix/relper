test_that("Expect TRUE", {

  expect_true(object = is_integer(1))

  expect_true(object = is_integer(0))

  expect_true(object = is_integer(1.0))

  expect_true(object = is_integer(-1))

})

test_that("Expect FALSE", {

  expect_false(object = is_integer(1.1))

  expect_false(object = is_integer(-1.1))

})


test_that("Wrong type", {

  expect_error(is_integer(x = "a"))

  expect_error(is_integer(x = TRUE))

})
