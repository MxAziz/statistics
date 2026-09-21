# E3-2: Best Critical Region (Neyman-Pearson Lemma)
set.seed(123)
n     <- 20
mu0   <- 0     # H0: mu = 0  (simple)
mu1   <- 2     # H1: mu = 2  (simple alternative)
sigma <- 1
alpha <- 0.05

# By Neyman-Pearson Lemma, the best critical region is: Reject H0 if xbar > c
c_value <- mu0 + qnorm(1 - alpha) * sigma/sqrt(n)
cat("Best Critical Region: Reject H0 if sample mean >", round(c_value, 4), "\n")

# Verify empirical Type I error under H0 via simulation
n_sim <- 10000
sim_means_h0 <- replicate(n_sim, mean(rnorm(n, mu0, sigma)))
empirical_alpha <- mean(sim_means_h0 > c_value)
cat("Empirical Type I error (alpha) :", empirical_alpha, " (target:", alpha, ")\n")

# Power of this best critical region under H1
sim_means_h1 <- replicate(n_sim, mean(rnorm(n, mu1, sigma)))
power <- mean(sim_means_h1 > c_value)
cat("Power of the test at mu1 =", mu1, "    :", power, "\n")

hist(sim_means_h0, breaks = 40, col = rgb(0,0,1,0.4), xlim = c(-1.5,3.5),
     probability = TRUE, main = "Best Critical Region: H0 vs H1", xlab = "Sample Mean")
hist(sim_means_h1, breaks = 40, col = rgb(1,0,0,0.4), probability = TRUE, add = TRUE)
abline(v = c_value, col = "black", lwd = 2, lty = 2)
legend("topright", legend = c("Distribution under H0","Distribution under H1","Critical value"),
       fill = c(rgb(0,0,1,0.4), rgb(1,0,0,0.4), NA), border = NA)