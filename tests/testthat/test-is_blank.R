
test_that("Expect TRUE", {

  expect_true(object = is_blank(""))

  expect_true(object = is_blank(" "))

  expect_true(object = is_blank("-"))

  expect_true(object = is_blank(NA_character_))

})

test_that("Expect FALSE", {

  expect_false(object = is_blank("a"))

})

test_that("Expect error", {

  expect_error(object = is_blank(TRUE))

  expect_error(object = is_blank(1))

})
