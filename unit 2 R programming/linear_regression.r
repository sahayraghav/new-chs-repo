%load_ext rpy2.ipython
%%R
data(mtcars)
%%R
str(mtcars)
%%R
lm_model <- lm(mpg ~ wt, data = mtcars)
%%R
summary(lm_model)
%%R
plot(mtcars$wt, mtcars$mpg, main = "Linear Regression", xlab = "Weight", ylab = "Miles per Gallon")
abline(lm_model, col = "red", lwd = 2)  # Add the regression line
%%R
head(mtcars)