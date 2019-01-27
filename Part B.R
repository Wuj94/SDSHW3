df <- read.csv("/home/data/MScDS/SDS/SDSHW3/NGC6611.csv")

hist(df$Mass, col = 'orchid', border = 'white', freq = F)

d <- density(df[,'Mass'])
plot(d, col = 'purple')
b <- boxplot(df[, 'Mass'])

# The shape of the mass distribution is a multimodal shape.
# Put tante boiate here.

