test_that("`qualtrics` objects are data frames",
          {
            expect_true(is.data.frame(qualtrics_example))
          })

test_that("`qualtrics` objects have class `qualtrics`",
          {
            expect_contains(class(qualtrics_example), "qualtrics") # need to import the data
          })

# test subsetting

test_that("`[` with only i",
          {
            expect_no_condition(qualtrics_example[1,])
          })

test_that("`[` with only j",
          {
            expect_no_condition(qualtrics_example[,1])
          })

test_that("`[` with i and j",
          {
            expect_no_condition(qualtrics_example[1,1])
          })

test_that("`[` with name",
          {
            expect_no_condition(qualtrics_example["start_date"])
          })

test_that("`[[` with i",
          {
            expect_no_condition(qualtrics_example[[1]])
          })

test_that("`[[` with name",
          {
            expect_no_condition(qualtrics_example[["start_date"]])
          })

test_that("`&` with name",
          {
            expect_no_condition(qualtrics_example$start_date)
          })
