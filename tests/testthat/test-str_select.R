test_that("Expect equal", {
  expect_equal(
    object = str_select(string = "zzzABC123",after = "ABC"),
    expected =  "123"
  )

  expect_equal(
    object = str_select(string = "zzzABC123",before = "ABC"),
    expected =  "zzz"
  )

})

test_that("Wrong type", {

  expect_error(object = str_select(string = "test",after = 1))

  expect_error(object = str_select(string = "test",before = 1))

  expect_error(object = str_select(string = "test",after = TRUE))

  expect_error(object = str_select(string = "test",before = TRUE))

})

test_that("Argument of length > 1", {

  expect_warning(object = str_select(string = "test",after = c("a","a")))

  expect_warning(object = str_select(string = "test",before = c("a","a")))

})


test_that("Lack of argument", {

  expect_error(object = str_select(string = "test"))

})
