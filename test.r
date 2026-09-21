# E1-2: Chi-square distributed data - generation and properties
set.seed(123)
n  <- 10000
df <- 6

chisq_data <- rchisq(n, df)

cat("Sample Mean       :", mean(chisq_data), " (Theoretical:", df, ")\n")
cat("Sample Variance    :", var(chisq_data), " (Theoretical:", 2*df, ")\n")
cat("Sample Skewness    :", mean((chisq_data-mean(chisq_data))^3)/sd(chisq_data)^3,
    " (Theoretical:", sqrt(8/df), ")\n")

hist(chisq_data, breaks = 50, probability = TRUE, col = "lightblue",
     main = paste("Chi-square Distribution (df =", df, ")"), xlab = "x")
curve(dchisq(x, df), add = TRUE, col = "red", lwd = 2)

# Relationship: sum of squares of standard normal variables
z <- matrix(rnorm(n*df), ncol = df)
chisq_manual <- rowSums(z^2)
cat("\nMean of manually generated Chi-square:", mean(chisq_manual), "\n")