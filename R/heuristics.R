

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
  "Prefer not to say"
  )
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

heuristics <- list(agree_5,
                   agree_7,
                   satisfied_5,
                   satisfied_7,
                   appropriate_5,
                   appropriate_7,
                   gender,
                   logical_3,
                   logical_4,
                   logical_5)




c("Under 18", "18 - 24", "25 - 34", "45 - 54", "55 - 64", "65 - 74", "75 - 84", "85 or older")

# need to create a list where each element is a list with the possible answers
# can I make the list have attr with the number to make it easier to sort through?
# how to deal with likerts that be multiple lengths (could be 5 or 7 or 9)?
# note that some values are specific to the higher point scales (can I look based on this?)
# should I keep the list of heuristics in the function itself or can I make it ds that lives in the package?
