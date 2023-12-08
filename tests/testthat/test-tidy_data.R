test_that("`read_qualtrics()` returns object of class `data.frame`",
          {
            file_path <- fs::path_package("extdata", "qualtrics_ex_data.csv", package = "EasyQualtrics")

            expect_true(is.data.frame(read_qualtrics(file_path)))
          })

test_that("`read_qualtrics()` returns an object of class `qualtrics`",
          {
            file_path <- fs::path_package("extdata", "qualtrics_ex_data.csv", package = "EasyQualtrics")

            expect_equal(class(read_qualtrics(file_path), "qualtrics")) # need to get the file path
          })
