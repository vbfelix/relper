test_that("Expect equal", {

  expect_equal(
    object = calc_auc(x = 1:3,y = 1:3),
    expected = 4
  )

  expect_equal(
    object = calc_auc(x = 1:3,y = 1:3,limits = NULL),
    expected = 4
  )

  expect_equal(
    object = calc_auc(x = 1:3,y = 1:3,limits = c(1,2)),
    expected = 1.5
  )
})

test_that("Warning of limits outbound", {

  expect_warning(object = calc_auc(x = 1:2,y = 1:2,limits = c(1,3)))

  expect_warning(object = calc_auc(x = 1:2,y = 1:2,limits = c(0,2)))

})


test_that("Wrong type", {

  expect_error(object = calc_auc(x = "a"))

  expect_error(object = calc_auc(y = "a"))

  expect_error(object = calc_auc(limits = "a"))

})

test_that("Wrong length", {

  expect_error(object = calc_auc(x = 1:2,y = 1:3))

  expect_error(object = calc_auc(limits = 1))

  expect_error(object = calc_auc(limits = 1:3))

})
