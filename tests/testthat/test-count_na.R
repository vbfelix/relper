test_that("Expect equal", {

  expect_equal(
    object = count_na(1:3),
    expected = 0
  )
  expect_equal(
    object = count_na(NA),
    expected = 1
  )
  expect_equal(
    object = count_na(letters),
    expected = 0
  )
  expect_equal(
    object = count_na(NA_character_),
    expected = 1
  )

})

