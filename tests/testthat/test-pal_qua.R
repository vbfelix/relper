test_that("Expect equal", {
  expect_equal(
    object = pal_qua(name = "this_is_us"),
    expected =  c("#2E2C33", "#E1AE1D", "#614330", "#968A82", "#E4B999")
    )

  expect_equal(
    object = pal_qua(name = "this_is_us",reverse = TRUE),
    expected =  rev(c("#2E2C33", "#E1AE1D", "#614330", "#968A82", "#E4B999"))
    )

})

test_that("Wrong type", {

  expect_error(object = pal_qua(name = "error"))

  expect_error(object = pal_qua(name = "this_is_us",reverse = 2))

  expect_error(object = pal_qua(name = "this_is_us",reverse = "a"))

})

test_that("Wrong length", {

  expect_error(object = pal_qua(name = c("a","b")))

  expect_error(object = pal_qua(name = "this_is_us",reverse = c(TRUE,TRUE)))

})
