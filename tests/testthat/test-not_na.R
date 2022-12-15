test_that("results", {

  expect_equal(
    object = not_na(2),
    expected = TRUE
  )

  expect_equal(
    object = not_na("A"),
    expected = TRUE
  )

  expect_equal(
    object = not_na(TRUE),
    expected = TRUE
  )

  expect_equal(
    object = not_na(NA),
    expected = FALSE
  )

  expect_equal(
    object = not_na(NA_real_),
    expected = FALSE
  )

})

test_that("warning", {


})

test_that("error", {

})
