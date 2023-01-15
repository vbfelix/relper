test_that("results", {
  expect_equal(
    object = palette_div(name = "sandman"),
    expected =  c("#876453", "#B7906B", "#E1C688", "#A7B79E", "#70ACA0")
    )

  expect_equal(
    object = palette_div(name = "sandman",reverse = TRUE),
    expected =  c("#70ACA0", "#A7B79E", "#E1C688", "#B7906B", "#876453")
    )

})

test_that("error", {

  expect_error(object = palette_div(name = "error"))

  expect_error(object = palette_div(name = c("a","b")))

  expect_error(object = palette_div(name = "sandman",reverse = 2))

  expect_error(object = palette_div(name = "sandman",reverse = "a"))

})
