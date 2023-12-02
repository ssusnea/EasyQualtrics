## code to prepare `DATASET` dataset goes here

# in this R file we should write code that will clean the case study csv file that we include in the install folder.
# a user who runs this script should be able to get the same cleaned data frame every time.

qualtrics_example <- read_qualtrics("inst/extdata/qualtrics_ex_data.csv")

usethis::use_data(qualtrics_example, overwrite = TRUE)
