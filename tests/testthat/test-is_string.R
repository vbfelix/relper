test_that("Expect TRUE", {

  expect_true(object = is_string("A"))

  expect_true(object = is_string(factor("A")))

})


test_that("Expect FALSE", {

  expect_false(object = is_string(1))

  expect_false(object = is_string(TRUE))

})
