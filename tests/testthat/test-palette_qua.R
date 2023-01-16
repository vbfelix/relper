test_that("results", {
  expect_equal(
    object = palette_qua(name = "this_is_us"),
    expected =  c("#2E2C33", "#E1AE1D", "#614330", "#968A82", "#E4B999")
    )

  expect_equal(
    object = palette_qua(name = "this_is_us",reverse = TRUE),
    expected =  rev(c("#2E2C33", "#E1AE1D", "#614330", "#968A82", "#E4B999"))
    )

})

test_that("error", {

  expect_error(object = palette_qua(name = "error"))

  expect_error(object = palette_qua(name = c("a","b")))

  expect_error(object = palette_qua(name = "this_is_us",reverse = 2))

  expect_error(object = palette_qua(name = "this_is_us",reverse = "a"))

})
