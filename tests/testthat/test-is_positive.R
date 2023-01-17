test_that("Expected equal", {

  expect_equal(
    object = is_positive(-1:1),
    expected = c(FALSE,FALSE,TRUE)
  )

})

test_that("Expect TRUE", {

  expect_true(object = is_positive(1))

  expect_true(object = is_positive(1.1))

})

test_that("Expect FALSE", {

  expect_false(object = is_positive(-1))

  expect_false(object = is_positive(-1.1))

})

test_that("Wrong type", {

  expect_error(is_positive(x = "a"))

  expect_error(is_positive(x = TRUE))

})
