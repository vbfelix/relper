test_that("Expect equal", {
  expect_equal(
    object = str_to_abb(string = c("AAAA","AAA")),
    expected =  c("Aaaa", "AAA")
    )

  expect_equal(
    object = str_to_abb(string = c("AAAA","AAA"),n_abb = 4),
    expected =  c("AAAA", "AAA")
  )

})

test_that("Wrong type", {

  expect_error(object = str_to_abb(string = 1,n_abb = 3))

  expect_error(object = str_to_abb(string = "test",n_abb = "0"))


})

test_that("Wrong value", {

  # n_abb > 0
  expect_error(object = str_to_abb(string = "test",n_abb = 0))

  # n_abb > 0
  expect_error(object = str_to_abb(string = "test",n_abb = -1))

})


