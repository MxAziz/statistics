# E1-5: Estimating population parameters from sample data
set.seed(123)
population <- rnorm(50000, mean = 40, sd = 8)

sample_data <- sample(population, 200)

n           <- length(sample_data)
sample_mean <- mean(sample_data)
sample_var  <- var(sample_data)
sample_sd   <- sd(sample_data)
se_mean     <- sample_sd/sqrt(n)

ci_lower <- sample_mean - qt(0.975, n-1) * se_mean
ci_upper <- sample_mean + qt(0.975, n-1) * se_mean

cat("Estimated Mean            :", sample_mean, "\n")
cat("Estimated Variance        :", sample_var, "\n")
cat("Estimated SD               :", sample_sd, "\n")
cat("Standard Error of Mean     :", se_mean, "\n")
cat("95% Confidence Interval    : [", ci_lower, ",", ci_upper, "]\n")
cat("True Population Mean       :", mean(population), "\n")
cat("True Population Variance   :", var(population), "\n")