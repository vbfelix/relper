test_that("Expect equal", {
  expect_equal(
    object = pal_div(name = "sandman"),
    expected =  c("#876453", "#B7906B", "#E1C688", "#A7B79E", "#70ACA0")
    )

  expect_equal(
    object = pal_div(name = "sandman",reverse = TRUE),
    expected =  c("#70ACA0", "#A7B79E", "#E1C688", "#B7906B", "#876453")
    )

})

test_that("Wrong type", {

  expect_error(object = pal_div(name = "error"))

  expect_error(object = pal_div(name = "sandman",reverse = 2))

  expect_error(object = pal_div(name = "sandman",reverse = "a"))

})

test_that("Wrong length", {

  expect_error(object = pal_div(name = c("a","b")))

  expect_error(object = pal_div(name = "sandman",reverse = c(TRUE,TRUE)))

})
