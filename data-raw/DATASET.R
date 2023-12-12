## code to prepare `DATASET` dataset goes here

# in this R file we should write code that will clean the case study csv file that we include in the install folder.
# a user who runs this script should be able to get the same cleaned data frame every time.
file_path <- fs::path_package("extdata", "qualtrics_ex_data.csv", package = "EasyQualtrics")

qualtrics_example <- read_qualtrics(file_path)

qualtrics_example$education <- textclean::replace_curly_quote(qualtrics_example$education)

usethis::use_data(qualtrics_example, overwrite = TRUE)
