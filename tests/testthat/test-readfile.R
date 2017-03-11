context("Read file")

test_that("read csv file into a tibble", {
    df <- fars_read("accident_2013.csv.bz2")

    expect_s3_class(df, "tbl")
    expect_gt(nrow(df), 0)
})
