test_that("results", {

  expect_equal(
    object = format_scale(1:2),
    expected = c(0, 1)
  )

  expect_equal(
    object = format_scale(1:2, new_min = 1, new_max = 5),
    expected = c(1,5)
  )

})

test_that("error", {

  expect_error(format_scale(x = "a"))

  expect_error(format_scale(x = 1))

  expect_error(format_scale(x = 1:2, new_min = 5, new_max = 1))

  expect_error(format_scale(x = 1:2, new_min = "a", new_max = 1))

  expect_error(format_scale(x = 1:2, new_min = 1, new_max = "a"))

  expect_error(format_scale(x = 1:2, new_min = 5:10, new_max = 100))

  expect_error(format_scale(x = 1:2, new_min = 5, new_max = 10:100))

})
