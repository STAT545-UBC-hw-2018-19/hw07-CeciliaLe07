context("testing need_boxcox ")

test_that("Stop works!",{
    y <- abs(rnorm(10))
    x <- rnorm(10)
    test_mod <- lm(y~x)
    expect_error(need_boxcox(test_mod,conf=50),"Confidence level should be between 0 and 1")
})

test_that("At least returns the correct object", {
    y <- abs(rnorm(10))
    x <- rnorm(10)
    test_mod <- lm(y~x)
    expect_is(need_boxcox(test_mod,plotit=FALSE), "character")
})

test_that("Correct dimension outputs", {
    y <- abs(rnorm(10))
    x <- rnorm(10)
    test_mod <- lm(y~x)
    expect_length(need_boxcox(test_mod,plotit=FALSE), 1)
})


