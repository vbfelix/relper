test_that("Expected equal", {

  expect_equal(
    object = is_zero(0:2),
    expected = c(TRUE,FALSE, FALSE)
  )

})

test_that("Expect TRUE", {

  expect_true(object = is_zero(0))

  expect_true(object = is_zero(-0))

})

test_that("Expect FALSE", {

  expect_false(object = is_zero(1))

  expect_false(object = is_zero(-1))

  expect_false(object = is_zero(1.0))

  expect_false(object = is_zero(1.1))

})


test_that("Wrong type", {

  expect_error(object = is_zero(x = "a"))

  expect_error(object = is_zero(x = TRUE))

})
