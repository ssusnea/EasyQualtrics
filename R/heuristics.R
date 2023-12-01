agree_5 <- factor(levels = c(
  "Strongly disagree",
  "Somewhat disagree",
  "Neither agree nor disagree",
  "Somewhat agree",
  "Strongly agree"),
  ordered = TRUE
  )

agree_7 <- factor(levels = c(
  "Strongly disagree",
  "Disagree",
  "Somewhat disagree",
  "Neither agree nor disagree",
  "Somewhat agree",
  "Agree",
  "Strongly agree"),
  ordered = TRUE
  )

satisfied_5 <- factor(levels = c(
  "Extremely dissatisfied",
  "Somewhat dissatisfied",
  "Neither satisfied nor dissatisfied",
  "Somewhat satisfied",
  "Extremely satisfied"),
  ordered = TRUE
  )

satisfied_7 <- factor(levels = c(
  "Extremely dissatisfied",
  "Moderately dissatisfied",
  "Slightly dissatisfied",
  "Neither satisfied nor dissatisfied",
  "Slightly satisfied",
  "Moderately satisfied",
  "Extremely satisfied"),
  ordered = TRUE
)

appropriate_5 <- factor(levels = c(
  "Extremely inappropriate",
  "Somewhat inappropriate",
  "Neither appropriate nor inappropriate",
  "Somewhat appropriate",
  "Extremely appropriate"),
  ordered = TRUE
)

appropriate_7 <- factor(levels = c(
  "Extremely inappropriate",
  "Moderately inappropriate",
  "Slightly inappropriate",
  "Neither appropriate nor inappropriate",
  "Slightly appropriate",
  "Moderately appropriate",
  "Extremely appropriate"),
  ordered = TRUE
)

gender <- factor(levels = c(
  "Male",
  "Female",
  "Non-binary / third gender",
  "Prefer not to say")
  )

logical_3 <- factor(levels = c(
  "False",
  "Neither true nor false",
  "True"),
  ordered = TRUE
  )

logical_4 <- factor(levels = c(
  "Definitely false",
  "Probably false",
  "Probably true",
  "Definitely true"),
  ordered = TRUE
  )

logical_5 <- factor(levels = c(
  "Definitely false",
  "Probably false",
  "Neither true nor false",
  "Probably true",
  "Definitely true"),
  ordered = TRUE
  )

y_n_5  <- factor(levels = c(
  "Definitely not",
  "Probably not",
  "Might or might not",
  "Probably yes",
  "Definitely yes"),
  ordered = TRUE
  )

yes_no_4  <- factor(levels = c(
  "Definitely not",
  "Probably not",
  "Probably yes",
  "Definitely yes"),
  ordered = TRUE
)

yes_no_3  <- factor(levels = c(
  "No",
  "Maybe",
  "Yes"),
  ordered = TRUE
)

yes_no_2  <- factor(levels = c(
  "No",
  "Yes"),
  ordered = TRUE
)

average_7 <- factor(levels = c(
  "Far below average",
  "Moderately below average",
  "Slightly below average",
  "Average",
  "Slightly above average",
  "Moderately above average",
  "Far above average"),
  ordered = TRUE
  )

average_5 <- factor(levels = c(
  "Far below average",
  "Somewhat below average",
  "Average",
  "Somewhat above average",
  "Far above average"),
  ordered = TRUE
)

average_3 <- factor(levels = c(
  "Below average",
  "Average",
  "Above average"),
  ordered = TRUE
)

better_worse_7 <- factor(levels = c(
  "Much worse",
  "Moderately worse",
  "Slightly worse",
  "About the same",
  "Slightly better",
  "Moderately better",
  "Much better"),
  ordered = TRUE
  )

better_worse_5 <- factor(levels = c(
  "Much worse",
  "Somewhat worse",
  "About the same",
  "Somewhat better",
  "Much better"),
  ordered = TRUE
)

difficult_easy_7 <- factor(levels = c(
  "Extremely difficult",
  "Moderately difficult",
  "Slightly difficult",
  "Neither easy nor difficult",
  "Slightly easy",
  "Moderately easy",
  "Extremely easy"),
  ordered = TRUE
  )

difficult_easy_5 <- factor(levels = c(
  "Extremely difficult",
  "Somewhat difficult",
  "Neither easy nor difficult",
  "Somewhat easy",
  "Extremely easy"),
  ordered = TRUE
)

effective <- factor(levels = c(
  "Not effective at all",
  "Slightly effective",
  "Moderately effective",
  "Very effective",
  "Extremely effective"),
  ordered = TRUE
  )

good_bad_7 <- factor(levels = c(
  "Extremely bad",
  "Moderately bad",
  "Slightly bad",
  "Neither good nor bad",
  "Slightly good",
  "Moderately good",
  "Extremely good"),
  ordered = TRUE
  )

good_bad_5 <- factor(levels = c(
  "Extremely bad",
  "Somewhat bad",
  "Neither good nor bad",
  "Somewhat good",
  "Extremely good"),
  ordered = TRUE
)


#' @title Qualtrics Likert-scale presets (re-class heuristics)
#'
#' @description
#' This list contains the Qualtrics Likert scale preset values. When the
#' [`make_likert()`] function is called, this is the list of possible Likert scales
#' it references when attempting to re-class the data frame.
#'
#' @export

heuristics <- list(agree_5,
                   agree_7,
                   satisfied_5,
                   satisfied_7,
                   appropriate_5,
                   appropriate_7,
                   gender,
                   logical_3,
                   logical_4,
                   logical_5,
                   yes_no_2,
                   yes_no_3,
                   yes_no_4,
                   average_3,
                   average_5,
                   average_5,
                   average_7,
                   better_worse_5,
                   better_worse_7,
                   difficult_easy_5,
                   difficult_easy_7,
                   effective,
                   good_bad_5,
                   good_bad_7
                   )




# c("Under 18", "18 - 24", "25 - 34", "45 - 54", "55 - 64", "65 - 74", "75 - 84", "85 or older")
