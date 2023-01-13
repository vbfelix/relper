test <- NULL

test_that("results", {

  expect_equal(
    object = obj_to_string(test),
    expected = "test"
  )

})
