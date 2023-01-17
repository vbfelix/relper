test_that("Expected equal", {

  expect_equal(object = as_perc(x = 1),expected =  100)

  expect_equal(object = as_perc(x = c(1,2)),expected =  c(100,200))

  expect_equal(object = as_perc(x = c(1,4), sum = TRUE),expected =  c(20,80))
})

test_that("Wrong type", {

  expect_error(as_perc(x = "a"))

  expect_error(as_perc(x = c(1,4), sum = 2))

  expect_error(as_perc(x = c(1,4), sum = "z"))

})

test_that("Wrong length", {

  expect_error(as_perc(x = c(1,4), sum = c(TRUE,FALSE)))

})
