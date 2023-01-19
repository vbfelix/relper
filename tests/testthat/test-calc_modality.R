
test_that("Expect equal", {

  expect_equal(
    object = calc_modality(x = c("a","a","a","b")),
    expected = 1
  )

  expect_equal(
    object = calc_modality(x = c("a","a","b","b")),
    expected = 2
  )

})




