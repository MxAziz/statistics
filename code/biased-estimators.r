# E2-2: Biased vs Unbiased Estimator of Variance
set.seed(123)
true_var <- 25
n        <- 20
n_sim    <- 5000

biased_var   <- numeric(n_sim)
unbiased_var <- numeric(n_sim)

for (i in 1:n_sim) {
  s <- rnorm(n, mean = 10, sd = sqrt(true_var))
  biased_var[i]   <- sum((s - mean(s))^2) / n       # divide by n (biased)
  unbiased_var[i] <- sum((s - mean(s))^2) / (n - 1)  # divide by n-1 (unbiased)
}

cat("True Variance                    :", true_var, "\n")
cat("Average Biased Estimator (/n)    :", mean(biased_var), "\n")
cat("Average Unbiased Estimator (/n-1):", mean(unbiased_var), "\n")
cat("Bias of Biased Estimator          :", mean(biased_var) - true_var, "\n")
cat("Bias of Unbiased Estimator        :", mean(unbiased_var) - true_var, "\n")

boxplot(biased_var, unbiased_var,
        names = c("Biased (/n)", "Unbiased (/n-1)"),
        col = c("tomato","lightgreen"),
        main = "Biased vs Unbiased Estimator of Variance")
abline(h = true_var, col = "blue", lwd = 2, lty = 2)