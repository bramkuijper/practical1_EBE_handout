# broken code on the evolution of hawks vs doves
# we intend to iterate the haploid population genetics
# recursion p(t+1) = p(t)*...
# but quite some things are missing or are wrong.
# Can you spot the errors / omissions?

# parameters coding the payoffs
c <- 2.0
v <- 1.0

# baseline fitness
w0 <- 10

# maximum time the simulation should run for
max_time <- 10000

# a vector containing allele frequencies
# for all time steps
p <- rep(x=NA, times=max_time)

# set the initial frequency of the hawks
# at time step 1
p[[1]] <- 0.1

# a for loop to iterate the recursion equation
# over multiple timesteps
for (time_idx in 1:(max_time-1))
{
  wH <- w0 + p[[time_idx]] * (v-c)/2 + (1-p[[time_idx]]) * v
  wD <- w0 + p[[time_idx]] * 0 + (1-p[[time_idx]]) * v/2
  
  wBar <- wH * p[[time_idx]] + wD * (1-p[[time_idx]])
  
  # recursion equation
  p[[time_idx + 1]] <- p[[time_idx]] * wH / wBar
}
