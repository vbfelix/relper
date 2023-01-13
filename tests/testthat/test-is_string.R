test_that("results", {

  expect_equal(
    object = is_string("A"),
    expected = TRUE
  )
  expect_equal(
    object = is_string(factor("A")),
    expected = TRUE
  )
  expect_equal(
    object = is_string(1),
    expected = FALSE
  )
  expect_equal(
    object = is_string(FALSE),
    expected = FALSE
  )

})


