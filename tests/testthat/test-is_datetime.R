test_that("Expect TRUE", {

  expect_true(is_datetime(Sys.time()))

})

test_that("Expect FALSE", {

  expect_false(object = is_datetime(Sys.Date()))

  expect_false(object = is_datetime(1))

  expect_false(object = is_datetime("a"))

})


