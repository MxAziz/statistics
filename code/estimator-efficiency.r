# E2-3: Efficiency of Estimators (Mean vs Median)
set.seed(123)
n         <- 30
n_sim     <- 5000
true_mean <- 15

means   <- numeric(n_sim)
medians <- numeric(n_sim)

for (i in 1:n_sim) {
  s <- rnorm(n, true_mean, 5)
  means[i]   <- mean(s)
  medians[i] <- median(s)
}

var_mean   <- var(means)
var_median <- var(medians)
efficiency <- var_mean / var_median

cat("Variance of Sample Mean          :", var_mean, "\n")
cat("Variance of Sample Median        :", var_median, "\n")
cat("Relative Efficiency (Mean/Median):", efficiency, "\n")

if (efficiency < 1) {
  cat("=> Sample Mean is more efficient than Sample Median\n")
} else {
  cat("=> Sample Median is more efficient than Sample Mean\n")
}

boxplot(means, medians, names = c("Mean","Median"),
        col = c("skyblue","salmon"),
        main = "Efficiency Comparison: Mean vs Median")