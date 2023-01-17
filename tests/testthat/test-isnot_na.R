test_that("Expect TRUE", {

  expect_true(object = isnot_na(2))

  expect_true(object = isnot_na("a"))

  expect_true(object = isnot_na(TRUE))

})


test_that("Expect FALSE", {

  expect_false(object = isnot_na(NA_real_))

  expect_false(object = isnot_na(NA))

  expect_false(object = isnot_na(NaN))

})

