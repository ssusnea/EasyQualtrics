test_df <- data.frame(
  colA = c(
    "Strongly disagree",
    "Disagree",
    "Somewhat disagree",
    "Neither agree nor disagree",
    "Somewhat agree",
    "Agree",
    "Strongly agree",
    "agree_8",
    "agree_9",
    "agree_10"),
  colB = c(
    "Strongly disagree",
    "Disagree",
    "Somewhat disagree",
    "Neither agree nor disagree",
    "Somewhat agree",
    "Agree",
    "Strongly agree",
    "Strongly disagree",
    "Disagree",
    "Somewhat disagree"),
  colC = c(
    "Strongly disagree",
    "Disagree",
    "Somewhat disagree",
    "Neither agree nor disagree",
    "Somewhat agree",
    "Agree",
    "Disagree",
    "Strongly disagree",
    "Disagree",
    "Somewhat disagree"),
  colD = c(
    "Strongly disagree",
    "Disagree",
    "Somewhat disagree",
    "Neither agree nor disagree",
    "Somewhat agree",
    "Agree",
    "Strongly agree",
    "Strongly disagree",
    "Disagree",
    "Somewhat disagreed")
)

test_that("`make_likert()` returns a data frame",
          {
            expect_equal(class(make_likert(test_df)), "data.frame")
          })

test_that("`detect_likert()` returns vector of class `character` if there are more than 9 levels",
          {
            expect_equal(class(detect_likert(test_df[[1]])), "character")
          })

test_that("`detect_likert()` returns a factor when all levels are present",
          {
            expect_equal(class(detect_likert(test_df[[2]])), "factor")
          })

test_that("`detect_likert()` returns a factor when not all levels are present, but all levels are in heuristic",
          {
            expect_equal(class(detect_likert(test_df[[3]])), "factor")
          })

test_that("`detect_likert()` returns vector of class `character` if not all levels match the heuristics",
          {
            expect_equal(class(detect_likert(test_df[[4]])), "character")
          })
