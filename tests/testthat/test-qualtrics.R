test_that("`qualtrics` objects are data frames",
          {
            expect_true(is.data.frame())
          })

test_that("`qualtrics` objects have class `qualtrics`",
          {
            expect_equal(class(example_data), "qualtrics") # need to import the data
          })

# test_that("`read_qualtrics()` returns the same data frame as `example_data`",
#           {
#             expect_identical(read_qualtrics(), example_data)
#           })

# test subsetting
