test_that("Expect TRUE", {

  expect_true(object = isnot_in("z",c("a","b","c")))

})

test_that("Expect FALSE", {

  expect_false(object = isnot_in("a",c("a","b","c")))

})


