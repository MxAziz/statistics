# E3-3: Type I and Type II Errors
set.seed(123)
mu0   <- 100    # H0: mu = 100
mu1   <- 105    # true mean under H1
sigma <- 15
n     <- 25
alpha <- 0.05
n_sim <- 10000

c_value <- mu0 + qnorm(1 - alpha) * sigma/sqrt(n)

# Type I error: Reject H0 when H0 is actually TRUE
data_h0 <- replicate(n_sim, mean(rnorm(n, mu0, sigma)))
type1_error <- mean(data_h0 > c_value)

# Type II error: Fail to reject H0 when H1 is actually TRUE
data_h1 <- replicate(n_sim, mean(rnorm(n, mu1, sigma)))
type2_error <- mean(data_h1 <= c_value)

cat("Critical value        :", c_value, "\n")
cat("Type I Error (alpha)  :", type1_error, "\n")
cat("Type II Error (beta)  :", type2_error, "\n")
cat("Power (1 - beta)      :", 1 - type2_error, "\n")

curve(dnorm(x, mu0, sigma/sqrt(n)), from = 85, to = 120, col = "blue", lwd = 2,
      main = "Type I and Type II Errors", ylab = "Density", xlab = "Sample Mean")
curve(dnorm(x, mu1, sigma/sqrt(n)), add = TRUE, col = "red", lwd = 2)
abline(v = c_value, col = "black", lty = 2, lwd = 2)
legend("topright", legend = c("Distribution under H0","Distribution under H1","Critical value"),
       col = c("blue","red","black"), lty = c(1,1,2), lwd = 2)