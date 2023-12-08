test_that("`qualtrics` objects are data frames",
          {
            expect_true(is.data.frame(example_data))
          })

test_that("`qualtrics` objects have class `qualtrics`",
          {
            expect_contains(class(example_data), "qualtrics") # need to import the data
          })

# test_that("`read_qualtrics()` returns the same data frame as `example_data`",
#           {
#             expect_identical(read_qualtrics(), example_data)
#           })

# test subsetting

test_that("`[` with only i",
          {
            expect_no_condition(example_data[1,])
          })

test_that("`[` with only j",
          {
            expect_no_condition(example_data[,1])
          })

test_that("`[` with i and j",
          {
            expect_no_condition(example_data[1,1])
          })

test_that("`[` with name",
          {
            expect_no_condition(example_data["start_date"])
          })

test_that("`[[` with i",
          {
            expect_no_condition(example_data[[1]])
          })

test_that("`[[` with name",
          {
            expect_no_condition(example_data[["start_date"]])
          })

test_that("`&` with name",
          {
            expect_no_condition(example_data$start_date)
          })
