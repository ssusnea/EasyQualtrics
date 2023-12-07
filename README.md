
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EasyQualtrics

<!-- badges: start -->
<!-- badges: end -->

The goal of EasyQualtrics is to enable a user to import .csv files
exported from Qualtrics into R and prepare those data sets for analysis
with ease.

## Installation

You can install the development version of EasyQualtrics from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ssusnea/EasyQualtrics")
```

## Importing a Qualtrics .csv

Given a file path for a .csv file, the `read_qualtrics` function imports
the .csv and prepares it for data analysis and visualization.

In the example below, the `file_path` variable is a stand in for a real
file path provided by the user.

``` r
library(EasyQualtrics)

file_path <- fs::path_package("extdata", "qualtrics_ex_data.csv", package = "EasyQualtrics")

mydata <- read_qualtrics(file_path)
#> Coerced following columns into Likert factors:
#> csat 
#> drivers_1 
#> drivers_2 
#> drivers_3 
#> drivers_4 
#> drivers_5 
#> drivers_6 
#> drivers_7 
#> drivers_8 
#> drivers_9 
#> drivers_10 
#> gender
```

From there the user analyze, wrangle, or visualize their Qualtrics data
as they would any other data set.
