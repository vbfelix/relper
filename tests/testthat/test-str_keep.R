test_that("results", {

  expect_equal(
    object = str_keep("A2#"),
    expected = "A"
  )

  expect_equal(
    object = str_keep("A2#","num"),
    expected = "2"
  )

  expect_equal(
    object = str_keep("A2#","special"),
    expected = "#"
  )

})

test_that("warning", {

})

test_that("error", {

  expect_error(object = str_keep(2,"text"))

  expect_error(object = str_keep("A2","aaaaa"))

  expect_error(object = str_keep("A2",2))

})
