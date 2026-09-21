# E3-4: Step-by-Step Hypothesis Testing
set.seed(123)

# Simulated data: claim is population mean weight = 70 kg
sample_data <- rnorm(35, mean = 72, sd = 6)

cat("========== Step-by-Step Hypothesis Testing ==========\n\n")

cat("Step 1: State the Hypotheses\n")
cat("   H0: mu = 70\n")
cat("   H1: mu != 70\n\n")

alpha <- 0.05
cat("Step 2: Set the Significance Level\n")
cat("   alpha =", alpha, "\n\n")

n    <- length(sample_data)
xbar <- mean(sample_data)
s    <- sd(sample_data)
se   <- s/sqrt(n)
cat("Step 3: Compute Sample Statistics\n")
cat("   n =", n, ", xbar =", round(xbar,3), ", s =", round(s,3),
    ", SE =", round(se,3), "\n\n")

t_stat <- (xbar - 70)/se
df     <- n - 1
cat("Step 4: Compute the Test Statistic\n")
cat("   t =", round(t_stat,4), " with df =", df, "\n\n")

p_value <- 2 * (1 - pt(abs(t_stat), df))
cat("Step 5: Compute the p-value\n")
cat("   p-value =", round(p_value,5), "\n\n")

cat("Step 6: Make a Decision\n")
if (p_value < alpha) {
  cat("   Since p-value <", alpha, ", we REJECT H0.\n")
} else {
  cat("   Since p-value >=", alpha, ", we FAIL TO REJECT H0.\n")
}

cat("\nStep 7: Verify with built-in t.test() function\n")
print(t.test(sample_data, mu = 70))