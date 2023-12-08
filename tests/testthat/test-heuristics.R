test_that("object `heuristics` is a list",
          {
            expect_true(is.list(heuristics))
          })

test_that("elements of `heuristics` are factors",
          {
            expect_true(all(map_lgl(.x = heuristics,
                                    .f = is.factor)))
          })
