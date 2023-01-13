test_that("results", {

  expect_equal(
    object = isnot_in("a",c("a","b","c")),
    expected = FALSE
  )

  expect_equal(
    object = isnot_in("z",c("a","b","c")),
    expected = TRUE
  )

})


