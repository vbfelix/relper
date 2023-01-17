test_that("Expect equal", {

  expect_equal(
    object = str_clean(string = "a..;éâ...íõ"),
    expected = "aeaio"
  )

  expect_equal(
    object = str_clean(string = "a..;éâ...íõ",remove_accent = TRUE,remove_punct = FALSE),
    expected = "a..;ea...io"
  )

  expect_equal(
    object = str_clean(string = "a..;éâ...íõ",remove_accent = FALSE,remove_punct = TRUE),
    expected = "aéâíõ"
  )

  expect_equal(
    object = str_clean(string = "a..;éâ...íõ",sub_punct = '-'),
    expected = "a---ea---io"
  )

})

test_that("Wrong type", {

  expect_error(object = str_clean(string = 2,remove_accent = "test"))

  expect_error(object = str_clean(string = "test",remove_accent = "test"))

  expect_error(object = str_clean(string = "test",remove_accent = 2))

  expect_error(object = str_clean(string = "test",remove_punct = "test"))

  expect_error(object = str_clean(string = "test",remove_punct = 2))

  expect_error(object = str_clean(string = "test",sub_punct = TRUE))

  expect_error(object = str_clean(string = "test",sub_punct = 2))



})

test_that("Wrong length", {

  expect_error(object = str_clean(string = "test",sub_punct = 1))

})
