
test_that("Expect TRUE", {

  expect_true(object = is_blank(""))

  expect_true(object = is_blank(" "))

  expect_true(object = is_blank("-"))

  expect_true(object = is_blank(NA_character_))

  expect_true(object = is_blank(NULL))

})

test_that("Expect FALSE", {

  expect_false(object = is_blank("a"))

  expect_false(object = is_blank(TRUE))

  expect_false(object = is_blank(1))

})

