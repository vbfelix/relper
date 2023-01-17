test_that("Expect TRUE", {

  expect_true(is_date(Sys.Date()))

})

test_that("Expect FALSE", {

  expect_false(object = is_date(Sys.time()))

  expect_false(object = is_date(1))

  expect_false(object = is_date("a"))

})



