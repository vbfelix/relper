test_that("results", {

  expect_equal(
    object = is_datetime(Sys.time()),
    expected = TRUE
  )

  expect_equal(
    object = is_datetime(Sys.Date()),
    expected = FALSE
  )

  expect_equal(
    object = is_datetime(1),
    expected = FALSE
  )

  expect_equal(
    object = is_datetime("a"),
    expected = FALSE
  )

})


