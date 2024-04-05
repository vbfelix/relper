test_that("Expect equal", {


  expect_equal(
    object = replace_na(NA,1),
    expected = 1
  )
  expect_equal(
    object = replace_na(NA_real_,1),
    expected = 1
  )

})

