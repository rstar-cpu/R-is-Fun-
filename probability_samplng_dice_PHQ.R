## ---------------------------------------------------------
## Six-Sided Die Example: Random Sampling and Probability
## ---------------------------------------------------------

## We will use the sample() function to simulate rolling a
## fair six-sided die.
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
## For our six-sided die:
##
## sample(1:6, size = 10, replace = TRUE)
##
## Here:
##
## x = 1:6            --> the six possible outcomes: 1, 2, 3, 4, 5, 6
## size = 10          --> roll the die 10 times
## replace = TRUE     --> after each roll, all six outcomes
##                       are possible again
##
## This makes each simulated roll independent of the previous roll.
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
## For a fair six-sided die, each outcome is equally likely.
##
## For example:
##
## P(Rolling a 1) = 1 / 6 = 0.167 = 16.7%
## P(Rolling a 2) = 1 / 6 = 0.167 = 16.7%
## P(Rolling a 3) = 1 / 6 = 0.167 = 16.7%
## P(Rolling a 4) = 1 / 6 = 0.167 = 16.7%
## P(Rolling a 5) = 1 / 6 = 0.167 = 16.7%
## P(Rolling a 6) = 1 / 6 = 0.167 = 16.7%
##
## The theoretical probability is approximately 16.7% for
## EVERY individual outcome on EVERY roll.
##
## However, this does not mean that every sample will contain
## exactly 16.7% of each number.
##
## Random chance creates sampling variability.
##
## With a small number of rolls, the observed proportions may
## differ substantially from the theoretical probabilities.
##
## As the number of rolls increases, we generally expect the
## observed proportions to get closer to the theoretical
## probability of 1/6 for each outcome.


## ---------------------------------------------------------
## 10 Die Rolls
## ---------------------------------------------------------

## Set the seed so this particular simulation is reproducible.
set.seed(123)

rolls_10 <- sample(1:6,
                   size = 10,
                   replace = TRUE)

## View all 10 rolls.
rolls_10

## Count how many times each number was rolled.
table(rolls_10)

## Calculate the observed proportions.
prop.table(table(rolls_10))

## We know:
##
## P(1) = 1/6
## P(2) = 1/6
## P(3) = 1/6
## P(4) = 1/6
## P(5) = 1/6
## P(6) = 1/6
##
## But with only 10 rolls, random chance can have a large effect.
##
## For example, one number might appear several times while another
## number might not appear at all.
##
## This does NOT mean that the die is necessarily unfair.
##
## Small samples tend to show more sampling variability.

hist(rolls_10,
     breaks = seq(0.5, 6.5, by = 1),
     xaxt = "n",
     main = "10 Rolls of a Six-Sided Die",
     xlab = "Die Outcome")

axis(1,
     at = 1:6,
     labels = 1:6)



## ---------------------------------------------------------
## 100 Die Rolls
## ---------------------------------------------------------

## Set the seed so this simulation is independently reproducible.
set.seed(123)

rolls_100 <- sample(1:6,
                    size = 100,
                    replace = TRUE)

## Count how many times each number was rolled.
table(rolls_100)

## Calculate the observed proportions.
prop.table(table(rolls_100))

## The theoretical probabilities have NOT changed:
##
## P(1) = P(2) = P(3) = P(4) = P(5) = P(6) = 1/6
##
## Each outcome still has approximately a 16.7% probability
## on every individual roll.
##
## With 100 rolls, some random variation will still occur.
##
## However, we generally expect the observed proportions to
## be closer to 1/6 for each outcome than they were with
## only 10 rolls.

hist(rolls_100,
     breaks = seq(0.5, 6.5, by = 1),
     xaxt = "n",
     main = "100 Rolls of a Six-Sided Die",
     xlab = "Die Outcome")

axis(1,
     at = 1:6,
     labels = 1:6)


## ---------------------------------------------------------
## 1,000 Die Rolls
## ---------------------------------------------------------

## Set the seed so this simulation is independently reproducible.
set.seed(123)

rolls_1000 <- sample(1:6,
                     size = 1000,
                     replace = TRUE)

## Count how many times each number was rolled.
table(rolls_1000)

## Calculate the observed proportions.
prop.table(table(rolls_1000))

## Again:
##
## P(1) = P(2) = P(3) = P(4) = P(5) = P(6) = 1/6
##
## With 1,000 rolls, we would expect each number to appear
## approximately:
##
## 1000 x (1/6) = 166.7 times
##
## We should NOT expect every number to appear exactly
## 166 or 167 times.
##
## However, with 1,000 rolls, the observed proportions will
## generally be much closer to the theoretical probability
## of approximately 16.7% for each outcome.
##
## As sample size increases, the observed proportions tend to
## become more stable and closer to the true probabilities.

hist(rolls_1000,
     breaks = seq(0.5, 6.5, by = 1),
     xaxt = "n",
     main = "1,000 Rolls of a Six-Sided Die",
     xlab = "Die Outcome")

axis(1,
     at = 1:6,
     labels = 1:6)

## ---------------------------------------------------------
## PHQ-9A Example: Random Sampling and Probability
## ---------------------------------------------------------

## Now let's apply the same probability concepts to a
## psychology-related example.
##
## Jenkins et al. (2023) studied 75 middle school students
## in Southern California and reported the following
## PHQ-9A depression severity categories:
##
## None               = 56.0%
## Mild               = 22.6%
## Moderate           = 16.0%
## Moderately severe  =  2.7%
## Severe             =  2.7%
##
## Unlike a fair six-sided die, these five possible outcomes
## do NOT have equal probabilities.
##
## We can use sample() again, but this time we will use
## the prob = argument to tell R how likely each outcome is.


## ---------------------------------------------------------
## Probability
## ---------------------------------------------------------

## The possible outcomes are:
##
## "None"
## "Mild"
## "Moderate"
## "Moderately severe"
## "Severe"
##
## The probabilities are:
##
## P(None)              = 0.560
## P(Mild)              = 0.226
## P(Moderate)          = 0.160
## P(Moderately severe) = 0.027
## P(Severe)            = 0.027
##
## Notice:
##
## .560 + .226 + .160 + .027 + .027 = 1.00
##
## When we use sample(), the probabilities must correspond
## to the outcomes in the same order.
##
## We will use set.seed() before each simulation so that each
## example can be reproduced independently.


## ---------------------------------------------------------
## Random Sample of 10 Youth
## ---------------------------------------------------------

set.seed(123)

phq_10 <- sample(c("None",
                   "Mild",
                   "Moderate",
                   "Moderately severe",
                   "Severe"),
                 size = 10,
                 replace = TRUE,
                 prob = c(.560, .226, .160, .027, .027))

## View all 10 observations.
phq_10

## Count the number of youth in each category.
table(phq_10)

## Calculate the observed proportions.
prop.table(table(phq_10))

## With only 10 observations, random chance can have
## a large effect.
##
## Some categories may appear more often than expected.
##
## Categories with low probabilities may not appear at all.
##
## This does NOT mean that their probability is zero.
##
## Small samples tend to show more sampling variability.

hist(as.numeric(factor(phq_10,
                       levels = c("None",
                                  "Mild",
                                  "Moderate",
                                  "Moderately severe",
                                  "Severe"))),
     breaks = c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5),
     xaxt = "n",
     main = "PHQ-9A Categories: 10 Youth",
     xlab = "Depression Severity")


axis(1,
     at = 1:5,
     labels = c("None",
                "Mild",
                "Moderate",
                "Mod. severe",
                "Severe"))


## ---------------------------------------------------------
## Random Sample of 100 Youth
## ---------------------------------------------------------

set.seed(123)

phq_100 <- sample(c("None",
                    "Mild",
                    "Moderate",
                    "Moderately severe",
                    "Severe"),
                  size = 100,
                  replace = TRUE,
                  prob = c(.560, .226, .160, .027, .027))

## Count the number of youth in each category.
table(phq_100)

## Calculate the observed proportions.
prop.table(table(phq_100))

## The probabilities have NOT changed:
##
## None               = 56.0%
## Mild               = 22.6%
## Moderate           = 16.0%
## Moderately severe  =  2.7%
## Severe             =  2.7%
##
## If we randomly sampled 100 youth using these probabilities,
## we would expect approximately:
##
## None               --> 100 x .560 = 56
## Mild               --> 100 x .226 = 22.6
## Moderate           --> 100 x .160 = 16
## Moderately severe  --> 100 x .027 = 2.7
## Severe             --> 100 x .027 = 2.7
##
## We should NOT expect these exact counts.
##
## Random sampling still produces variability.

hist(as.numeric(factor(phq_100,
                       levels = c("None",
                                  "Mild",
                                  "Moderate",
                                  "Moderately severe",
                                  "Severe"))),
     breaks = c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5),
     xaxt = "n",
     main = "PHQ-9A Categories: 100 Youth",
     xlab = "Depression Severity")

axis(1,
     at = 1:5,
     labels = c("None",
                "Mild",
                "Moderate",
                "Mod. severe",
                "Severe"))


## ---------------------------------------------------------
## Random Sample of 1,000 Youth
## ---------------------------------------------------------

set.seed(123)

phq_1000 <- sample(c("None",
                     "Mild",
                     "Moderate",
                     "Moderately severe",
                     "Severe"),
                   size = 1000,
                   replace = TRUE,
                   prob = c(.560, .226, .160, .027, .027))

## Count the number of youth in each category.
table(phq_1000)

## Calculate the observed proportions.
prop.table(table(phq_1000))

## If we randomly sampled 1,000 youth using these probabilities,
## we would expect approximately:
##
## None               --> 1000 x .560 = 560
## Mild               --> 1000 x .226 = 226
## Moderate           --> 1000 x .160 = 160
## Moderately severe  --> 1000 x .027 = 27
## Severe             --> 1000 x .027 = 27
##
## We still should not expect these exact counts.
##
## However, with 1,000 observations, the observed proportions
## will generally be closer to the probabilities used to
## generate the data.
##
## As sample size increases, observed proportions generally
## become more stable.

hist(as.numeric(factor(phq_1000,
                       levels = c("None",
                                  "Mild",
                                  "Moderate",
                                  "Moderately severe",
                                  "Severe"))),
     breaks = c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5),
     xaxt = "n",
     main = "PHQ-9A Categories: 1,000 Youth",
     xlab = "Depression Severity")

axis(1,
     at = 1:5,
     labels = c("None",
                "Mild",
                "Moderate",
                "Mod. severe",
                "Severe"))

