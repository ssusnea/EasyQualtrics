test_that("`read_qualtrics()` returns an object of class `qualtrics`",
          {
            expect_equal(class(read_qualtrics(), "qualtrics")) # need to get the file path
          })

test_that("`qualtrics` objects are data frames",
          expect_true(is.data.frame())) # do I need to basically do the vingette in the tests?

test_that("`qualtrics` objects have class `qualtrics`",
          {
            expect_equal(class(read_qualtrics()), "qualtrics") # need to import the data
          })

test_that("`read_qualtrics()` returns the same data frame as `example_data`",
          {
            expect_identical(read_qualtrics(), example_data)
          })
