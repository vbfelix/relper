test_that("results", {
  expect_equal(
    object = str_select(string = "zzzABC123",after = "ABC"),
    expected =  "123"
  )

  expect_equal(
    object = str_select(string = "zzzABC123",before = "ABC"),
    expected =  "zzz"
  )

})

test_that("error", {

  expect_error(object = str_select(string = "ABC123"))

})
