# E1-4: Sampling distribution of medians and ranges
set.seed(123)
pop <- rnorm(100000, mean = 50, sd = 10)   # population

n_samples   <- 1000
sample_size <- 30

medians <- numeric(n_samples)
ranges  <- numeric(n_samples)

for (i in 1:n_samples) {
  s <- sample(pop, sample_size)
  medians[i] <- median(s)
  ranges[i]  <- max(s) - min(s)
}

cat("Mean of sample medians :", mean(medians), "\n")
cat("SD of sample medians   :", sd(medians), "\n")
cat("Mean of sample ranges  :", mean(ranges), "\n")
cat("SD of sample ranges    :", sd(ranges), "\n")

par(mfrow = c(1,2))
hist(medians, breaks = 30, col = "orange",
     main = "Sampling Distribution of Median", xlab = "Median")
hist(ranges, breaks = 30, col = "purple",
     main = "Sampling Distribution of Range", xlab = "Range")