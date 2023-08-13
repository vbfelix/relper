test_that("Expect equal", {

  expect_equal(
    object = str_keep("A2#","text"),
    expected = "A"
  )

  expect_equal(
    object = str_keep("A2#","num"),
    expected = 2
  )

  expect_equal(
    object = str_keep("A2#","special"),
    expected = "#"
  )

})

test_that("Wrong type", {

  expect_error(object = str_keep(string = 2,keep = "text"))

  expect_error(object = str_keep(string = "A2",keep = 2))

})

test_that("Invalid option", {


  expect_error(object = str_keep(string = "A2",keep = "aaaaa"))

})
