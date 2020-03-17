# install.packages("testthat")



test_that("single number", {
  expect_equal(0, 0)
  expect_equal(1, 1)
})