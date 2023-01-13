test_that("results", {

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

test_that("error", {

  expect_error(object = str_clean(2,"text"))

  expect_error(object = str_clean("A2","aaaaa"))

  expect_error(object = str_clean("A2",2))

})
