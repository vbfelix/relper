
test_that("results", {

  expect_equal(
    object = calc_mode(c("a","a","a","b")),
    expected = "a"
  )

})



