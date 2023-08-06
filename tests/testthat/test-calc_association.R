set.seed(123);x <- sample(0:1,50,replace = TRUE)
set.seed(456);y <- sample(0:1,50,replace = TRUE)
set.seed(123);z <- sample(0:2,50,replace = TRUE)

test_that("Expect equal", {

  #cramers'v
  expect_equal(
    object = calc_association(x = x,y = x,type = "cramers-v"),
    expected = 0.958333333333333
    )

  #phi
  expect_equal(
    object = calc_association(x = x,y = y,type = "phi"),
    expected = -0.166666666666667
  )

})

test_that("Wrong type", {

  #x
  expect_error(object = calc_association(x = "a",y = y))

  expect_error(object = calc_association(x = TRUE, y = y))

  #y
  expect_error(object = calc_association(x = x,y = "y"))

  expect_error(object = calc_association(x = x, y = TRUE))

  #type
  expect_error(object = calc_association(x = x,y = y,type = 2))

  expect_error(object = calc_association(x = x,y = y,type = TRUE))

})


test_that("Wrong length", {

  #x and y
  expect_error(object = calc_association(x = x,y = 1:2))

  #x and y / fisher
  expect_error(object = calc_association(x = z,y = z,type = "fisher"))

  expect_error(object = calc_association(x = z,y = z,type = "phi"))


})

test_that("Invalid option", {

  expect_error(object = calc_association(x = x,y = y,type = "test"))

})
