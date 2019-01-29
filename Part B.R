df <- read.csv("/home/data/MScDS/SDS/SDSHW3/NGC6611.csv")

# histogram and density ---------------------------------------------------

par(mfrow = c(1,2))
hist(df$Mass, col = 'orchid', border = 'white',
     main = "Histogram of the masses in NGC661")
"The histogram of the masses recorded in the NGC6611 dataset shows that 
the most common mass value is under 0.5. Moreover, as the value of the mass
increases, we get an increasingly lower number of observation for that value."


hist(df$Mass, probability = T, col = "orchid", border = 'white',
     main = "Density of the masses in NGC661")
d <- density(df$Mass)
plot(d, col = "blue", lwd = 3, xlim = c(0, 1.8) )
"The density plot shows a multimodal distribution even though the distribution
is quite a decreasing distribution after the first mode."

par(mfrow = c(1,1))
# boxplot -----------------------------------------------------------------

par(mfrow = c(1,1))
b <- boxplot(df$Mass)
b$stats
"Now we see that most of the data is between 0.1575 and 0.6715 and few of them
is above 0.6715"


# summary statistics ------------------------------------------------------
mean(df$Mass)
median(df$Mass)
var(df$Mass)
sd(df$Mass)
IQR(df$Mass)

# sample skewness
skewn <- function (X) {
  n <- length(X)
  num <- 1 / n * sum((X-mean(X))^3)
  den <- 1 / (n-1) * sum((X-mean(X))^2)
    
  num/(den^(3/2))
}

skewn(df$Mass)

"skewness is a measure of asymmetry around the mean. Since we have a positive
skewness coefficient we confirm that the distribution of the masses recorded in
NGC661 have a right tail, this means that the mass of the distribution is 
concentrated on the left of our density"

# sample kurtosis
kurt <- function(x) {
  mea <- mean(x)
  m4 <- sum((x - mea)^4)/length(x)
  m2 <- sum((x - mea)^2)/length(x)
  
  return(m4/(m2^2) - 3)
}

kurt(df$Mass)
