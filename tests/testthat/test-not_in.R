test_that("results", {

  expect_equal(
    object = not_in("a",c("a","b","c")),
    expected = FALSE
  )

  expect_equal(
    object = not_in("z",c("a","b","c")),
    expected = TRUE
  )

})

test_that("warning", {


})

test_that("error", {

})
