test_that("Expect equal", {

  expect_equal(
    object = calc_geometric_mean(x = 1:10),
    expected = 4.52872868811677
  )

})

test_that("Value <= 0", {

  expect_warning(calc_geometric_mean(x = 0))

  # expect_warning(calc_geometric_mean(x = -1))

})

test_that("Wrong type", {

  expect_error(calc_geometric_mean(x = "a"))

  expect_error(calc_geometric_mean(x = TRUE))

})
