# E3-1: Decision-making process using Hypothesis Testing
set.seed(123)

# H0: mu = 50   vs   H1: mu != 50
true_mu <- 52
n       <- 30
sigma   <- 8
alpha   <- 0.05
n_sim   <- 1000

decisions <- character(n_sim)

for (i in 1:n_sim) {
  s <- rnorm(n, true_mu, sigma)
  z_stat <- (mean(s) - 50) / (sigma/sqrt(n))
  p_val  <- 2 * (1 - pnorm(abs(z_stat)))
  decisions[i] <- ifelse(p_val < alpha, "Reject H0", "Fail to Reject H0")
}

print(table(decisions))
cat("\nProportion of 'Reject H0' decisions:", mean(decisions == "Reject H0"), "\n")
cat("(Since H1 is actually true here, this proportion represents the Power of the test)\n")