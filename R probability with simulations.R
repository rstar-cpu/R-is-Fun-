## ---------------------------------------------------------
## Coin Flip Example: Random Sampling and Probability
## ---------------------------------------------------------

## We will use the sample() function to simulate flipping a coin.
##
## The sample() function randomly selects values from a set of
## possible values that we provide.
##
## General form:
##
## sample(x, size, replace = TRUE)
##
## x       = the possible values that can be selected
## size    = how many random selections we want
## replace = whether a value can be selected more than once
##
## For our coin flip:
##
## sample(c("Heads", "Tails"), size = 10, replace = TRUE)
##
## Here:
##
## x = c("Heads", "Tails")  --> the two possible outcomes
## size = 10                --> flip the coin 10 times
## replace = TRUE           --> after each flip, Heads and Tails
##                              are both possible again
##
## This makes each simulated flip independent of the previous flip.
##
## We will also use set.seed() before each simulation.
##
## sample() produces random results, so running the same sample()
## command again can produce a different random sample.
##
## set.seed() makes the random sample reproducible.
##
## We will set the seed separately for each example so that each
## section can be run independently and still produce the same results.


## ---------------------------------------------------------
## Probability
## ---------------------------------------------------------

## The basic probability formula is:
##
## P(A) = Number of favorable outcomes / Total number of possible outcomes
##
## For a fair coin:
##
## P(Heads) = 1 / 2 = 0.50 = 50%
## P(Tails) = 1 / 2 = 0.50 = 50%
##
## The theoretical probability is 50% for EVERY individual flip.
##
## However, this does not mean that every sample will contain
## exactly 50% Heads and 50% Tails.
##
## Random chance creates sampling variability.
##
## With a small number of flips, the observed proportions may
## differ substantially from 50/50.
##
## As the number of flips increases, we generally expect the
## observed proportions to get closer to the theoretical
## probabilities of 50% and 50%.


## ---------------------------------------------------------
## 10 Coin Flips
## ---------------------------------------------------------

## Set the seed so this particular simulation is reproducible.
set.seed(123)

flips_10 <- sample(c("Heads", "Tails"),
                   size = 10,
                   replace = TRUE)

## View all 10 flips.
flips_10

## Count the number of Heads and Tails.
table(flips_10)

## Calculate the observed proportions.
prop.table(table(flips_10))

## We know:
##
## P(Heads) = 0.50
## P(Tails) = 0.50
##
## But with only 10 flips, random chance can have a large effect.
##
## We might observe something like 7 Heads and 3 Tails even though
## the true probability is 50/50.
##
## Small samples tend to show more sampling variability.

hist(as.numeric(factor(flips_10,
                       levels = c("Tails", "Heads"))),
     breaks = c(0.5, 1.5, 2.5),
     xaxt = "n",
     main = "10 Coin Flips",
     xlab = "Outcome")

axis(1,
     at = c(1, 2),
     labels = c("Tails", "Heads"))


## ---------------------------------------------------------
## 100 Coin Flips
## ---------------------------------------------------------

## Set the seed so this simulation is independently reproducible.
set.seed(123)

flips_100 <- sample(c("Heads", "Tails"),
                    size = 100,
                    replace = TRUE)

## Count the number of Heads and Tails.
table(flips_100)

## Calculate the observed proportions.
prop.table(table(flips_100))

## The theoretical probabilities have NOT changed:
##
## P(Heads) = 0.50
## P(Tails) = 0.50
##
## With 100 flips, some random variation will still occur.
##
## However, we generally expect the observed proportions to
## be closer to 50/50 than they were with only 10 flips.

hist(as.numeric(factor(flips_100,
                       levels = c("Tails", "Heads"))),
     breaks = c(0.5, 1.5, 2.5),
     xaxt = "n",
     main = "100 Coin Flips",
     xlab = "Outcome")

axis(1,
     at = c(1, 2),
     labels = c("Tails", "Heads"))


## ---------------------------------------------------------
## 1,000 Coin Flips
## ---------------------------------------------------------

## Set the seed so this simulation is independently reproducible.
set.seed(123)

flips_1000 <- sample(c("Heads", "Tails"),
                     size = 1000,
                     replace = TRUE)

## Count the number of Heads and Tails.
table(flips_1000)

## Calculate the observed proportions.
prop.table(table(flips_1000))

## Again:
##
## P(Heads) = 0.50
## P(Tails) = 0.50
##
## We still should not expect exactly 500 Heads and 500 Tails.
##
## However, with 1,000 flips, the observed proportions will
## generally be much closer to the theoretical 50/50 split.
##
## As sample size increases, the observed proportion tends to
## become more stable and closer to the true probability.

hist(as.numeric(factor(flips_1000,
                       levels = c("Tails", "Heads"))),
     breaks = c(0.5, 1.5, 2.5),
     xaxt = "n",
     main = "1,000 Coin Flips",
     xlab = "Outcome")

axis(1,
     at = c(1, 2),
     labels = c("Tails", "Heads"))


## ---------------------------------------------------------
## Part 2: Randomly Selecting Trauma-Exposed Youth
## ---------------------------------------------------------

## Now let's apply the same probability concepts to a
## psychology-related example.
##
## Visser et al. (2026) reported that approximately 12% of
## trauma-exposed youth met criteria for DSM-5 PTSD.
##
## For this classroom simulation, imagine that we are randomly
## selecting youth from a very large population of youth who
## have experienced trauma.
##
## Each randomly selected youth can fall into one of two groups:
##
## "PTSD"
## "No PTSD"
##
## We will assume:
##
## P(PTSD) = 0.12 = 12%
## P(No PTSD) = 0.88 = 88%
##
## In other words, each time we randomly select a trauma-exposed
## youth, there is a 12% probability that the selected youth
## has PTSD and an 88% probability that the selected youth
## does not have PTSD.
##
## We will use sample() to simulate randomly selecting youth.
##
## Unlike the coin-flip example, the two outcomes do NOT have
## equal probabilities.
##
## Therefore, we use the prob = argument:
##
## prob = c(.12, .88)
##
## This tells R:
##
## "PTSD"    --> 12% probability
## "No PTSD" --> 88% probability
##
## Just as before, we will use set.seed() before EACH random
## sample so that each example can be reproduced independently.


## ---------------------------------------------------------
## Randomly Select 100 Trauma-Exposed Youth
## ---------------------------------------------------------

set.seed(123)

ptsd_100 <- sample(c("PTSD", "No PTSD"),
                   size = 100,
                   replace = TRUE,
                   prob = c(.12, .88))

## Count how many randomly selected youth have PTSD.
table(ptsd_100)

## Calculate the observed proportions.
prop.table(table(ptsd_100))

## The probability of PTSD for each randomly selected youth is:
##
## P(PTSD) = 0.12
##
## If we randomly select 100 trauma-exposed youth, we would
## expect approximately:
##
## 100 x .12 = 12 youth with PTSD
##
## However, random selection does NOT guarantee exactly
## 12 youth with PTSD.
##
## One random sample might contain fewer than 12.
## Another might contain more than 12.
##
## This difference between random samples is called
## sampling variability.

barplot(table(ptsd_100),
        main = "Random Sample of 100 Trauma-Exposed Youth",
        xlab = "PTSD Status",
        ylab = "Number of Youth")


## ---------------------------------------------------------
## Randomly Select 500 Trauma-Exposed Youth
## ---------------------------------------------------------

set.seed(123)

ptsd_500 <- sample(c("PTSD", "No PTSD"),
                   size = 500,
                   replace = TRUE,
                   prob = c(.12, .88))

## Count how many randomly selected youth have PTSD.
table(ptsd_500)

## Calculate the observed proportions.
prop.table(table(ptsd_500))

## The population probability remains:
##
## P(PTSD) = 0.12
##
## If we randomly select 500 trauma-exposed youth, we would
## expect approximately:
##
## 500 x .12 = 60 youth with PTSD
##
## Again, we should not expect exactly 60.
##
## Because the sample is larger, however, the observed
## proportion of youth with PTSD will generally be closer
## to the population value of 12%.

barplot(table(ptsd_500),
        main = "Random Sample of 500 Trauma-Exposed Youth",
        xlab = "PTSD Status",
        ylab = "Number of Youth")


## ---------------------------------------------------------
## Randomly Select 1,000 Trauma-Exposed Youth
## ---------------------------------------------------------

set.seed(123)

ptsd_1000 <- sample(c("PTSD", "No PTSD"),
                    size = 1000,
                    replace = TRUE,
                    prob = c(.12, .88))

## Count how many randomly selected youth have PTSD.
table(ptsd_1000)

## Calculate the observed proportions.
prop.table(table(ptsd_1000))

## The population probability remains:
##
## P(PTSD) = 0.12
##
## If we randomly select 1,000 trauma-exposed youth, we would
## expect approximately:
##
## 1000 x .12 = 120 youth with PTSD
##
## The actual number in our random sample may be somewhat
## higher or lower than 120.
##
## However, the observed prevalence will generally be more
## stable and closer to 12% than in smaller random samples.

barplot(table(ptsd_1000),
        main = "Random Sample of 1,000 Trauma-Exposed Youth",
        xlab = "PTSD Status",
        ylab = "Number of Youth")


## ---------------------------------------------------------
## Randomly Select 10,000 Trauma-Exposed Youth
## ---------------------------------------------------------

set.seed(123)

ptsd_10000 <- sample(c("PTSD", "No PTSD"),
                     size = 10000,
                     replace = TRUE,
                     prob = c(.12, .88))

## Count how many randomly selected youth have PTSD.
table(ptsd_10000)

## Calculate the observed proportions.
prop.table(table(ptsd_10000))

## The population probability remains:
##
## P(PTSD) = 0.12
##
## If we randomly select 10,000 trauma-exposed youth, we would
## expect approximately:
##
## 10000 x .12 = 1,200 youth with PTSD
##
## We still should not expect exactly 1,200.
##
## However, with such a large random sample, the observed
## proportion will generally be quite close to 12%.
##
## As the number of randomly selected youth increases,
## random sampling variability in the estimated prevalence
## tends to decrease.

barplot(table(ptsd_10000),
        main = "Random Sample of 10,000 Trauma-Exposed Youth",
        xlab = "PTSD Status",
        ylab = "Number of Youth")