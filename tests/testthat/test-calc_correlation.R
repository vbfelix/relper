set.seed(123);x <- sample(0:1,50,replace = TRUE)
set.seed(123);y <- rnorm(50)
set.seed(123);z <- sample(0:2,50,replace = TRUE)

test_that("Expected equal", {

  expect_equal(
    object = calc_correlation(x = x,y = x),
    expected = 1
  )

})


test_that("Wrong type", {

  #x
  expect_error(object = calc_correlation(x = "a",y = y))

  expect_error(object = calc_correlation(x = TRUE, y = y))

  #y
  expect_error(object = calc_correlation(x = x,y = "y"))

  expect_error(object = calc_correlation(x = x, y = TRUE))

  #type
  expect_error(object = calc_correlation(x = x,y = y,type = 2))

  expect_error(object = calc_correlation(x = x,y = y,type = TRUE))

})


test_that("Wrong length", {

  #x and y
  expect_error(object = calc_correlation(x = x,y = 1:2))

})

test_that("Invalid option", {

  expect_error(object = calc_correlation(x = x,y = y,type = "test"))

})
