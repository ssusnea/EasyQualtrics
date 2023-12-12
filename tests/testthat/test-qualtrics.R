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
            expect_equal(length(qualtrics_example[1:2,]), 2)
          })

test_that("`[` with only j",
          {
            expect_equal(length(qualtrics_example[,1:2]), 2)
          })

test_that("`[` with i and j",
          {
            expect_equal(length(qualtrics_example[1:2,1:2]), 2)
          })

test_that("`[` with name",
          {
            expect_equal(length(qualtrics_example["start_date"]), 1)
          })

test_that("`[[` with i",
          {
            expect_equal(length(qualtrics_example[[1]]), 100)
          })

test_that("`[[` with name",
          {
            expect_equal(length(qualtrics_example[["start_date"]]), 100)
          })

test_that("`$` with name",
          {
            expect_equal(length(qualtrics_example$start_date), 100)
          })
