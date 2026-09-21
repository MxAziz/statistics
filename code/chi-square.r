# E1-2: Chi-square distributed data - generation and properties
set.seed(123)
n  <- 10000
df <- 6

chisq_data <- rchisq(n, df)

cat("Sample Mean       :", mean(chisq_data), " (Theoretical:", df, ")\n")
cat("Sample Variance    :", var(chisq_data), " (Theoretical:", 2*df, ")\n")

hist(chisq_data, breaks = 50, probability = TRUE, col = "lightblue",
     main = paste("Chi-square Distribution (df =", df, ")"), xlab = "x")
curve(dchisq(x, df), add = TRUE, col = "red", lwd = 2)

# Relationship: sum of squares of standard normal variables -- chaile bad diye dio.
z <- matrix(rnorm(n*df), ncol = df)
chisq_manual <- rowSums(z^2)
cat("\nMean of manually generated Chi-square:", mean(chisq_manual), "\n")


# k <- 5
# N_sim <- 1000
# set.seed(123)
# chi2_data <- rchisq(N_sim, df = k)

# mean_chi2 <- mean(chi2_data)
# var_chi2  <- var(chi2_data)

# print(paste("Mean:", mean_chi2))
# print(paste("Variance:", var_chi2))

# par(mfrow = c(1,3))
# hist(chi2_data, breaks = 30, col = "lightblue", probability = TRUE,
#      main = "Chi-Squared Distribution", xlab = "Value", border = "white")
# curve(dchisq(x, df = k), add = TRUE, col = "red", lwd = 2)

# plot(density(chi2_data), col = "blue", lwd = 2, main = "Density Plot", xlab = "Value")
# curve(dchisq(x, df = k), add = TRUE, col = "red", lwd = 2)

# qqplot(qchisq(ppoints(N_sim), df = k), chi2_data,
#        main = "Q-Q plot for Chi-Squared Data", col = "blue",
#        xlab = "Theoretical quantities", ylab = "sample quantities")
# abline(0, 1, col = "red", lwd = 2)