test_that("Expect equal", {

  expect_equal(
    object = calc_mean(x = 1:10),
    expected = 5.5
  )

  expect_equal(
    object = calc_mean(x = 1:10,'geometric'),
    expected = 4.52872868811677
  )

  expect_equal(
    object = calc_mean(x = 1:10,'harmonic'),
    expected = 3.41417152147406
  )

  expect_equal(
    object = calc_mean(x = c(1:10,100),trim = .1),
    expected = mean(x = c(1:10,100),trim = .1)
  )

  expect_equal(
    object = calc_mean(x = 1:10,weight =  1:10),
    expected = weighted.mean(x = 1:10,w = 1:10)
  )

})

test_that("Value <= 0", {

  expect_warning(calc_mean(x = 0,'geometric'))

  expect_warning(calc_mean(x = c(-1,2),'geometric'))

})

test_that("Wrong type", {

  expect_error(calc_mean(x = "a"))

  expect_error(calc_mean(x = TRUE))

  expect_error(calc_mean(type = 2))

  expect_error(calc_mean(trim = "a"))

  expect_error(calc_mean(weight = "a"))


})

test_that("Wrong combination", {

  expect_error(calc_mean(x = 1,type = "geometric",weight = .5))

  expect_error(calc_mean(x = 1,type = "harmonic",weight = .5))

})

test_that("Wrong length", {

  expect_error(calc_mean(x = 1,weight = 1:2))


})
