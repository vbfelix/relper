test_that("Expect equal", {

  expect_equal(
    object = format_scale(1:2),
    expected = c(0, 1)
  )

  expect_equal(
    object = format_scale(1:2,new_min = 0,new_max = 1),
    expected = c(0, 1)
  )

  expect_equal(
    object = format_scale(1:2, new_min = 1, new_max = 5),
    expected = c(1,5)
  )

})

test_that("Wrong type", {

  expect_error(format_scale(x = "a"))

  expect_error(format_scale(x = 1:2, new_min = "a", new_max = 1))

  expect_error(format_scale(x = 1:2, new_min = 1, new_max = "a"))

})

test_that("Wrong length", {


  expect_error(format_scale(x = 1))

  expect_error(format_scale(x = 1:2, new_min = 5:10, new_max = 100))

  expect_error(format_scale(x = 1:2, new_min = 5, new_max = 10:100))

})

test_that("Wrong value", {

  expect_error(format_scale(x = 1:2, new_min = 5, new_max = 1))

})

