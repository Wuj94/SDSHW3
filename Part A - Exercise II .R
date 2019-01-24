
# HW3 - Part A - Exercise II ----------------------------------------------

# 2. Choose two suitable (prior) distributions for μ and σ 2 and write 
# the corresponding R code to simulate a sample of
# n = 10000 random vectors from the joint distribution by forward/ancestral sampling.

# Since we have no clue of what the distribution is, we need to choose two 
# noninformative priors. So, we choose two flat/uniform priors, hence Beta(1,1)

n <- 10000
data <- matrix(data = NA, nrow=n, ncol=7)
colnames(data) <- c('mu1', 'mu2', 'sigma2', 'x1', 'x2', 'y1', 'y2')

for(i in 1:n){
  data[i, "mu1"] <- rbeta(1, 1, 1)
  data[i, "mu2"] <- rbeta(1, 1, 1)
  data[i, "sigma2"] <- rbeta(1, 1, 1)
  
  data[i, "x1"] <- rnorm(1, data[i, "mu1"], sqrt(data[i, "sigma2"]))
  data[i, "x2"] <- rnorm(1, data[i, "mu2"], sqrt(data[i, "sigma2"]))
  data[i, "y1"] <- rnorm(1, data[i, "mu1"], sqrt(data[i, "sigma2"]))
  data[i, "y2"] <- rnorm(1, data[i, "mu2"], sqrt(data[i, "sigma2"]))
}

# 3. Show a suitable plot with the empirical distribution of each component of the X vector. What theoretical distribution
# are you approximately describing?
hist(data[,"x1"])
hist(data[,"x2"])
