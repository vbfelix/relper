test_that("Expect equal", {

  expect_equal(
    object = str_extract_char(string = "abcdef"),
    expected = "a"
  )

  expect_equal(
    object = str_extract_char(string = "Abcdef"),
    expected = "A"
  )

  expect_equal(
    object = str_extract_char(string = "1Abcdef"),
    expected = "1"
  )

})

test_that("Wrong type", {

  expect_error(object = str_extract_char(string = 2))

  expect_error(object = str_extract_char(string = "abcdef",char = "a"))

  expect_error(object = str_extract_char(string = "abcdef",char = 2.5))


})

test_that("Wrong range", {

  expect_error(object = str_extract_char(string = "abcdef",char = 0))

  expect_error(object = str_extract_char(string = "abcdef",char = -1))


})
