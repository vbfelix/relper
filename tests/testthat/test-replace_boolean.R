test_that("Expect equal", {


  expect_equal(
    object = replace_boolean(c(T,T,F),1,0),
    expected = c(1,1,0)
  )

})

