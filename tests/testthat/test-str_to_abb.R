test_that("results", {
  expect_equal(
    object = str_to_abb(string = c("AAAA","AAA")),
    expected =  c("Aaaa", "AAA")
    )

  expect_equal(
    object = str_to_abb(string = c("AAAA","AAA"),n_char = 4),
    expected =  c("AAAA", "AAA")
  )

})

test_that("error", {

  expect_error(object = str_to_abb(string = c("AAAA","AAA"),n_char = 0))

  expect_error(object = str_to_abb(string = c("AAAA","AAA"),n_char = -1))

  expect_error(object = str_to_abb(string = c("AAAA","AAA"),n_char = "0"))

  expect_error(object = str_to_abb(string = 1,n_char = 3))

})
