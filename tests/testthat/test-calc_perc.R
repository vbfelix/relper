data_calc_perc <-
  data.frame(
    grp1 = c("a","b","a","b","c","c"),
    grp2 = c("1","2","1","2","1","2")
  )

grp1 <-
  structure(list(grp1 = c("a", "b", "c"),
                 n = c(2L, 2L, 2L),
                 perc = c(33.3333333333333,33.3333333333333, 33.3333333333333)),
            row.names = c(NA, -3L), class = c("tbl_df","tbl", "data.frame"))

grp2 <-
structure(list(grp2 = c("1", "1", "2", "2"),
               grp1 = c("a", "c","b", "c"),
               n = c(2L, 1L, 2L, 1L),
               perc = c(66.6666666666667, 33.3333333333333, 66.6666666666667, 33.3333333333333)),
          class = c("grouped_df",  "tbl_df", "tbl", "data.frame"),
          row.names = c(NA, -4L),
          groups = structure(list(
            grp2 = c("1", "2"), .rows = structure(list(1:2, 3:4), ptype = integer(0),
                                                  class = c("vctrs_list_of","vctrs_vctr", "list"))),
            row.names = c(NA, -2L), .drop = TRUE, class = c("tbl_df","tbl", "data.frame")))

test_that("Expected equal", {

  expect_equal(object = calc_perc(mtcars,vs),expected =  calc_perc(mtcars,"vs"))

  expect_equal(
    object = calc_perc(data_calc_perc,grp1),
    expected =  grp1
    )

  expect_equal(
    object = calc_perc(data_calc_perc,grp1,grp2),
    expected =  grp2
  )


  expect_equal(
    object = calc_perc(data_calc_perc,c(grp1,grp2),grp2),
    expected =  grp2
  )

})

test_that("Wrong type", {

  expect_error(calc_perc(df = "a"))

  expect_error(calc_perc(df = 1))

  expect_error(calc_perc(df = mtcars,grp_var = jojo))

})

