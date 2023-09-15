test_that("Expect equal", {
  expect_equal(
    object = pal_seq(name = "andor"),
    expected =  c("#E5CDB5", "#D6965F", "#D16F3A", "#AD4727", "#733527", "#44383A")
    )

  expect_equal(
    object = pal_seq(name = "andor",reverse = TRUE),
    expected =  rev(c("#E5CDB5", "#D6965F", "#D16F3A", "#AD4727", "#733527", "#44383A"))
    )

})

test_that("Wrong type", {

  expect_error(object = pal_seq(name = "error"))

  expect_error(object = pal_seq(name = "andor",reverse = 2))

  expect_error(object = pal_seq(name = "andor",reverse = "a"))

})

test_that("Wrong length", {

  expect_error(object = pal_seq(name = c("a","b")))

  expect_error(object = pal_seq(name = "andor",reverse = c(TRUE,TRUE)))

})

