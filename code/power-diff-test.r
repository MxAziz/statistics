# E3-5: Power Comparison of Different Tests (Z-test, t-test, Wilcoxon test)
set.seed(123)
n       <- 20
mu0     <- 50
true_mu <- 54
sigma   <- 8
alpha   <- 0.05
n_sim   <- 5000

power_z       <- 0
power_t       <- 0
power_wilcox  <- 0

for (i in 1:n_sim) {
  s <- rnorm(n, true_mu, sigma)

  # Z-test (sigma assumed known)
  z_stat <- (mean(s) - mu0) / (sigma/sqrt(n))
  p_z <- 2 * (1 - pnorm(abs(z_stat)))
  if (p_z < alpha) power_z <- power_z + 1

  # One-sample t-test
  p_t <- t.test(s, mu = mu0)$p.value
  if (p_t < alpha) power_t <- power_t + 1

  # Wilcoxon signed-rank test (non-parametric)
  p_w <- suppressWarnings(wilcox.test(s, mu = mu0)$p.value)
  if (p_w < alpha) power_wilcox <- power_wilcox + 1
}

cat("Power of Z-test        :", power_z / n_sim, "\n")
cat("Power of t-test        :", power_t / n_sim, "\n")
cat("Power of Wilcoxon test :", power_wilcox / n_sim, "\n")

barplot(c(Z = power_z/n_sim, T = power_t/n_sim, Wilcoxon = power_wilcox/n_sim),
        col = c("skyblue","lightgreen","salmon"),
        main = "Power Comparison of Different Tests", ylab = "Power")