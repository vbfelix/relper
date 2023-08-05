
test_that("Expect equal", {

  expect_equal(
    object = calc_combination(n = 10,r = 4,order_matter = FALSE,with_repetition = TRUE),
    expected = 715
    )

  expect_equal(
    object = calc_combination(n = 10,r = 4,order_matter = FALSE,with_repetition = FALSE),
    expected = 210
  )

  expect_equal(
    object = calc_combination(n = 8,r = 3,order_matter = TRUE,with_repetition = FALSE),
    expected = 336
  )

})

