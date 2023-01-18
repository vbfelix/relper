
test_that("Expect equal", {

  expect_equal(
    object = calc_mode(x = c("a","a","a","b")),
    expected = "a"
  )

})

test_that("Ties", {

  expect_warning(object = calc_mode(c("a","a","b","b")))

})


