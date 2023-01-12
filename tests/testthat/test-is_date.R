test_that("results", {

  expect_equal(
    object = is_date(Sys.Date()),
    expected = TRUE
  )
  expect_equal(
    object = is_date(Sys.time()),
    expected = FALSE
  )



})

test_that("warning", {


})

test_that("error", {


})
