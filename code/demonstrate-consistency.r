# E2-1: Demonstrate consistency by increasing sample size

set.seed(123)

mu <- 5
sizes <- seq(10, 1000, by = 10)
means <- numeric(length(sizes))

for (i in seq_along(sizes)) {
  means[i] <- mean(rnorm(sizes[i], mean = mu, sd = 2))
}

# Output
cat("Sample mean at n=10:", means[1], "\n")
cat("Sample mean at n=1000:", means[length(means)], "\n")
cat("True mean:", mu, "\n")


# Create PDF file
pdf("E2_1.pdf", width = 8, height = 6)

# Graph
plot(sizes, means,
     type = "l",
     col = "blue",
     lwd = 2,
     main = "Consistency: Sample Mean vs Sample Size",
     xlab = "Sample Size",
     ylab = "Sample Mean")

# True mean line
abline(h = mu,
       col = "red",
       lwd = 2,
       lty = 2)

# Legend
legend("topright",
       legend = c("Sample Mean", "True Mean"),
       col = c("blue", "red"),
       lty = c(1, 2),
       lwd = 2)

# Close PDF
dev.off()







# # E2-1: Demonstrate consistency by increasing sample size

# set.seed(123)

# mu <- 5
# sizes <- seq(10, 1000, by = 10)
# means <- numeric(length(sizes))

# for (i in seq_along(sizes)) {
#   means[i] <- mean(rnorm(sizes[i], mean = mu, sd = 2))
# }

# # Output
# cat("Sample mean at n=10:", means[1], "\n")
# cat("Sample mean at n=1000:", means[length(means)], "\n")
# cat("True mean:", mu, "\n")

# # Graph
# plot(sizes, means,
#      type = "l",
#      col = "blue",
#      lwd = 2,
#      main = "Consistency: Sample Mean vs Sample Size",
#      xlab = "Sample Size",
#      ylab = "Sample Mean")

# # True mean line
# abline(h = mu,
#        col = "red",
#        lwd = 2,
#        lty = 2)

# # Legend
# legend("topright",
#        legend = c("Sample Mean", "True Mean"),
#        col = c("blue", "red"),
#        lty = c(1, 2),
#        lwd = 2)