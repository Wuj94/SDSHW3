df <- read.csv("/home/data/MScDS/SDS/SDSHW3/NGC6611.csv")

hist(df$Mass, col = 'orchid', border = 'white')
"The histogram of the masses recorded in the NGC6611 dataset shows that 
the most common mass value is under 0.5. Moreover, as the value of the mass
increases, we get an increasingly lower number of observation for that value."

d <- density(df$Mass)
plot(d, col = 'purple')
"The density plot shows a multimodal distribution even though the distribution
is quite a decreasing distribution after the first mode."

b <- boxplot(df$Mass)
b$stats
"Now we see that most of the data is between 0.1575 and 0.6715 and few of them
is above 0.6715"
