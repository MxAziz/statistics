# E1-3: Comparison of t-distribution with normal distribution (small df)
set.seed(123)
n        <- 10000
df_small <- 5

t_data <- rt(n, df_small)
z_data <- rnorm(n)

plot(density(z_data), col = "blue", lwd = 2,
     main = "t-distribution vs Normal Distribution (small df)",
     xlab = "x", ylim = c(0,0.45), xlim = c(-6,6))
lines(density(t_data), col = "red", lwd = 2)
legend("topright", legend = c("Normal(0,1)", paste("t (df =", df_small, ")")),
       col = c("blue","red"), lwd = 2)

cat("Variance of Normal(0,1)   :", var(z_data), "\n")
cat("Variance of t (df=5)      :", var(t_data),
    " (Theoretical:", df_small/(df_small-2), ")\n\n")

# Effect of increasing degrees of freedom
cat("Effect of increasing df (t -> Normal as df increases):\n")
dfs <- c(2, 5, 15, 30, 100)
for (d in dfs) {
  cat("df =", d, " -> t-distribution variance =", var(rt(n, d)), "\n")
}