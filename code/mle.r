# E2-4: Maximum Likelihood Estimation (MLE) - Binomial, Poisson, Normal
set.seed(123)

## ---- Binomial MLE of p ----
n_trials <- 20
true_p   <- 0.3
binom_data <- rbinom(1000, n_trials, true_p)
mle_p <- mean(binom_data) / n_trials
cat("Binomial MLE of p     :", mle_p, " (True p:", true_p, ")\n")

## ---- Poisson MLE of lambda ----
true_lambda <- 4
pois_data <- rpois(1000, true_lambda)
mle_lambda <- mean(pois_data)
cat("Poisson MLE of lambda :", mle_lambda, " (True lambda:", true_lambda, ")\n")

## ---- Normal MLE of mu and sigma^2 ----
true_mu <- 10; true_sigma <- 3
norm_data <- rnorm(1000, true_mu, true_sigma)
mle_mu     <- mean(norm_data)
mle_sigma2 <- mean((norm_data - mle_mu)^2)     # MLE divides by n (not n-1)
cat("Normal MLE of mu       :", mle_mu, " (True mu:", true_mu, ")\n")
cat("Normal MLE of sigma^2  :", mle_sigma2, " (True sigma^2:", true_sigma^2, ")\n")

## ---- Verify Normal MLE numerically using optim() ----
neg_log_lik <- function(par, data) {
  -sum(dnorm(data, mean = par[1], sd = sqrt(par[2]), log = TRUE))
}
result <- optim(c(0, 1), neg_log_lik, data = norm_data)
cat("optim() MLE estimate - mu:", result$par[1],
    " sigma^2:", result$par[2], "\n")