context("testing apply_boxcox ")

test_that("At least returns the correct object", {
    y <- abs(rnorm(10))
    x <- rnorm(10)
    test_mod <- lm(y~x)
    expect_is(apply_boxcox(test_mod), "list")
})

test_that("Correct dimension outputs", {
    y <- abs(rnorm(10))
    x <- rnorm(10)
    test_mod <- lm(y~x)
    expect_length(apply_boxcox(test_mod,transformed=FALSE), 1)
    expect_length(apply_boxcox(test_mod)$transformed, 10)
})

test_that("Correct named outputs",{
    y <- abs(rnorm(10))
    x <- rnorm(10)
    test_mod <- lm(y~x)
    expect_named(apply_boxcox(test_mod,transformed=FALSE), "lambda")
    expect_named(apply_boxcox(test_mod), c("lambda","transformed_response"))
})
