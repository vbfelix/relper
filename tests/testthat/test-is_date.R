test_that("results", {

  expect_equal(
    object = is_date(Sys.Date()),
    expected = TRUE
  )
  expect_equal(
    object = is_date(Sys.time()),
    expected = FALSE
  )

  expect_equal(
    object = is_date(1),
    expected = FALSE
  )

  expect_equal(
    object = is_date("a"),
    expected = FALSE
  )

})


