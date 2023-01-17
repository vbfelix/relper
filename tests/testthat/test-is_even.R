test_that("Expected equal", {

  expect_equal(
    object = is_even(1:3),
    expected = c(FALSE,TRUE, FALSE)
  )

})

test_that("Expect TRUE", {

  expect_true(object = is_even(2))

  expect_true(object = is_even(-2))

  expect_true(object = is_even(2.0))

  expect_true(object = is_even(2.2))

})

test_that("Expect FALSE", {

  expect_false(object = is_even(1))

  expect_false(object = is_even(-1))

  expect_false(object = is_even(1.0))

  expect_false(object = is_even(1.1))

})

test_that("Warning: value coerced to NA", {

  expect_warning(object = is_even(x = 0))

})

test_that("Wrong type", {

  expect_error(object = is_even(x = "a"))

  expect_error(object = is_even(x = TRUE))

})
