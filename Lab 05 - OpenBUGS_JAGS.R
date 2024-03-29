# *********************************************************************** #
#                ** Statistical Methods for Data Science I **             #
#                        ** OpenBUGS/JAGS basics **                       #
# *********************************************************************** #

#' ---
#' title:  "Statistical Methods for Data Science I"
#' author: "Pierpaolo Brutti"
#' date:   "Lab 05 - OpenBUGS/JAGS basics"
#' ---

# Setup -------------------------------------------------------------------

suppressMessages(require(R2jags, quietly = TRUE))
# suppressMessages(require(R2OpenBUGS, quietly = TRUE))

# Model -------------------------------------------------------------------

# The model can be written as an R function
model <- function() {
  theta ~ dbeta(a,b) # prior distribution
  y ~ dbin(theta, m) # sampling distribution
  y.pred ~ dbin(theta, n) # predictive distribution 
  P.crit <- step(y.pred - ncrit + 0.5) # = 1 if y.pred >= ncrit 
}

# Data --------------------------------------------------------------------

# These values could alternatively have been given in model description
dd <- list(a = 9.2,      # parameters of prior distribution
           b = 13.8,     #
           y = 15,       # number of successes
           m = 20,       # number of trials
           n  = 40,      # future number of trials
           ncrit = 25)   # critical value of future successes

# First short run ---------------------------------------------------------

# Initial values / one set for all the chains
init <- function() list( theta = 0.5 )

# Main function
?jags # or <bugs> for OpenBUGS

fit <- jags(model = model, init = init, 
            param = c("theta", "P.crit"), 
            data = dd, n.iter = 500, 
            n.chain = 3, n.burn = 0,
            DIC = FALSE)

# Quick look
fit
# plot( fit )

# Take a look inside the output / no raw data visibles
class(fit)
names(fit)
fit$BUGSoutput
fit$parameters.to.save
fit$model.file

# Get the actual chains
?as.mcmc
mcfit = as.mcmc(fit)
class(mcfit)
length(mcfit)

# Extract the *first* chain
chain <- mcfit[[1]]    # 1st chain
head( chain )          #
class( chain )         # mcmc obj
dim( chain )           # n.sim x n.param
dimnames( chain )      # col names

# Traceplot 1D ------------------------------------------------------------

# Enlarge the subplots
par(mar = c(1, 1, 1, 1), 
    oma = c(4, 4, 0.2, 0.2))
traceplot(fit, ask = FALSE, 
          mfrow = c(2,1))
# traceplot(fit) # one by one

# Density plot ------------------------------------------------------------

class( chain )
?plot.mcmc

par(mar = c(1, 1, 1, 1), 
    oma = c(4, 4, 0.2, 0.2),
    mfrow = c(2,2))
plot( chain, auto.layout = F)

# Summary -----------------------------------------------------------------

summary( chain )
