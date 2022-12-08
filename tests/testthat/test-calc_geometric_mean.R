
test_that("results", {

  expect_equal(
    object = calc_geometric_mean(1:10),
    expected = 4.52872868811677
  )

})

test_that("warning", {

  expect_warning(calc_geometric_mean(0))

})

test_that("error", {

  expect_error(calc_geometric_mean("a"))

})
