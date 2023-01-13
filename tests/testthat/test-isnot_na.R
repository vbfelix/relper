test_that("results", {

  expect_equal(
    object = isnot_na(2),
    expected = TRUE
  )

  expect_equal(
    object = isnot_na("A"),
    expected = TRUE
  )

  expect_equal(
    object = isnot_na(TRUE),
    expected = TRUE
  )

  expect_equal(
    object = isnot_na(NA),
    expected = FALSE
  )

  expect_equal(
    object = isnot_na(NA_real_),
    expected = FALSE
  )

})


