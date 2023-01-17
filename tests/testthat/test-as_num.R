test_that("results", {

  expect_equal(
    object = as_num(x = "1.000"),
    expected =  1000
    )

  expect_equal(
    object = as_num(x = "-1.000"),
    expected =  -1000
  )

  expect_equal(
    object = as_num(x = "R$ -1.000"),
    expected =  -1000
  )

  expect_equal(
    object = as_num(x = "$ 1.000,20"),
    expected =  1000.20
  )

  expect_equal(
    object = as_num(x = "AUS 1.000,20"),
    expected =  1000.20
  )

  expect_equal(
    object = as_num(x = "1.000,20"),
    expected =  1000.2
    )

  expect_equal(
    object = as_num(x = "0,20"),
    expected =  .2
    )

  expect_equal(
    object = as_num(x = "-0,20"),
    expected =  -.2
  )

})

test_that("warning", {

  expect_warning(object = as_num(x = "s"))

})


test_that("error", {

  expect_error(object = as_num(x = 1))

  expect_error(object = as_num(x = "1",thousand_mark = 1))

  expect_error(object = as_num(x = "1",thousand_mark = c("a","b")))

})
