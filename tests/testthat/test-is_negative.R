test_that("Expected equal", {

  expect_equal(
    object = is_negative(-1:1),
    expected = c(TRUE,FALSE,FALSE)
  )

})

test_that("Expect TRUE", {

  expect_true(object = is_negative(-1))

  expect_true(object = is_negative(-1.1))

})

test_that("Expect FALSE", {

  expect_false(object = is_negative(1))

  expect_false(object = is_negative(1.1))

})

test_that("Wrong type", {

  expect_error(is_negative(x = "a"))

  expect_error(is_negative(x = TRUE))

})

