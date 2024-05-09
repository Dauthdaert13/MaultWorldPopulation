library(testthat)
library(MaultWorldPopulation)

test_that("error on invalid country name", {
  expect_error(CountryPopulation("Atlantis"))
})

test_that("no error on valid country name", {
  expect_silent(CountryPopulation("Brazil"))
})
