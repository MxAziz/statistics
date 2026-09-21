# E1-1: F-distribution and its relationship with Chi-square distribution
set.seed(123)

n   <- 10000
df1 <- 5
df2 <- 10

# Generate F-distributed data directly
f_data <- rf(n, df1, df2)

# Generate F data from two independent Chi-square variables
# F = (Chisq1/df1) / (Chisq2/df2)
chisq1 <- rchisq(n, df1)
chisq2 <- rchisq(n, df2)
f_from_chisq <- (chisq1/df1) / (chisq2/df2)

cat("Mean of rf() sample            :", mean(f_data), "\n")
cat("Mean of F derived from Chisq    :", mean(f_from_chisq), "\n")
cat("Theoretical mean of F(df1,df2)  :", df2/(df2-2), "\n")

par(mfrow = c(1,2))
hist(f_data, breaks = 50, probability = TRUE, col = "skyblue",
     main = "F-distribution (rf)", xlab = "F value", xlim = c(0,5))
curve(df(x, df1, df2), add = TRUE, col = "red", lwd = 2)

hist(f_from_chisq, breaks = 50, probability = TRUE, col = "lightgreen",
     main = "F from Chi-square ratio", xlab = "F value", xlim = c(0,5))
curve(df(x, df1, df2), add = TRUE, col = "red", lwd = 2)