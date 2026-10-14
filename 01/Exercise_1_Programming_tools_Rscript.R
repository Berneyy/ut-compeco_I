
# 0.  before starting (!)           ####

# 1. add your name here: 
# 2. save this file under the name: "Exercise_1_Programming_tools_yourlastname_yourfirstname.R" (File -> Save as...)
# 3. run the following two lines
rm(list=ls())    # this empties the work space (top-right window in RStudio)
set.seed(222)    # set seed for random number generators

#                                   ####
# 1. Sequences / vectors (5 points) ####
# a) create a parameter/object called "a" that contains a sequence of integers from 2 to 20 with a step size of 1 


# b) create a parameter called "b" that contains a sequence from 0 to 111 with step size 10 


# c) create a parameter called "c" that contains the five entries 3,2,9,5,10


# d) create a parameter called "d" that contains 40 repetitions of the value 6 (40 times the same value)


# e) create a parameter called "e" that contains the value 1 in the first 20 entries and the value 3 in the following 30 entries 


# 2. Matrix              (5 points) ####
# a) create a matrix called "population" with 20 rows and 6 columns. Each entry shall be a "-1" at first (without the "" signs).


# b) assign to matrix "population" the column names "patch", "age", "temperature", "humidity", "flowers", "root length" (in this order).


# c) enter a "1" (without the "") in all entries of the first column (that means: assign each individual to patch 1) 


# d) assign the first 8 individuals to age=1, and the last 12 individuals to age=2 (2 points). 


# 3. Random numbers      (5 points) ####
# a) pick 20 numbers randomly from a normal distribution (with mean=8.3, standard deviation=0.97) and insert these values into the 3rd column of population ("temperature")


# b) pick 20 random numbers from the uniform distribution (between 0 and 100) and insert these values into the 4th column ("humidity")


# c) pick 20 random numbers from a poisson distribution (with mean and variance lambda=3) and insert these values into the 5th column ("flowers")


# d) pick 20 random numbers from from the values 10, 11, 12, 13, 14 (with replacements) where these values occur with probabilities 0.2, 0.2, 0.1, 0.2, 0.3, respectively. Insert them into the 6th column (root length). (2 points).


# 4. Logical tests       (5 points) ####

# ! In case you could not fill all the required columns of population (e.g., exercise 1.2 and 1.3), please uncomment the following two lines (remove the first # signs) and run these two lines:
# population1           <-  matrix(nrow=10, ncol=6, data=c(1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 2.000, 2.000, 2.000, 2.000, 8.006, 8.748, 8.633, 9.981, 6.716, 9.088, 8.160, 9.514, 8.333, 8.850, 39.024, 5.664, 25.232, 28.725, 15.885, 57.697, 19.705, 90.133, 24.974, 10.326, 3.000, 2.000, 3.000, 2.000, 2.000, 2.000, 1.000, 2.000, 4.000, 2.000, 11.000, 10.000, 13.000, 13.000, 12.000, 12.000, 11.000, 12.000, 12.000, 12.000))
# colnames(population1) <- c("patch", "age", "temperature", "humidity", "flowers", "root length")

# a) commit a logical test: which of all the individuals in "population" are located in patch 1 (as output you should get a vector of logical statements: TRUE FALSE ...)


# b) commit a logical test: test which of the individuals in "population" are located in a patch different from patch=1 (as output provide a vector of logical statements)


# c) commit a logical test: test which individuals in "population" experience a mean annual temperature larger than or equal to 8.4 (as output provide a vector with logical statements)


# d) commit a logical test and provide the row number(s) of all individuals that have precisely 14 flowers (hint: the function which() might be helpful) (2 points)


# 5. subsetting a matrix (5 points) ----
# a) create a matrix called "popAge1" that contains all individuals of "population" that are exactly 1 year old (age=1)


# b) create a matrix called "popTempLow" that contains all individuals of "population" that experience temperatures lower than or identical to 8.5


# c) create a matrix called "popHumLarge" that contains all individuals of "population" that experience humidity larger than 81.5%


# d) create a matrix called "popFlow14not" that contains all individuals of "population" with a flower number different from 14


# e) create a matrix called "popRoot10" that contains all individuals of "population" with a root length of 3
#    (make sure that the result has still the matrix format: the logical test "is.matrix(popRoot10)" (without "") should be TRUE)



# 6. for loop            (5 points) ####
# a) create a for-loop where the parameter "t" goes from 0 to 100 in steps of 1 (it should be empty, without any content between curly brackets)



# b) create a for-loop where the parameter "f" takes the values "a", "b", "c", "d", "e", one after the other. Inside the loop (within the curly brackets) add "print(f)"



# c) create a for-loop that cycles through all "humidity" values of the matrix "population", one after the other, and print its content. To do this, use the function print().



# d) create a for-loop that cycles through all "humidity" values of the matrix "population", multiply each value by 1.3, and replace the old value with this new value (2 points).



# 7. if conditions       (5 points) ####
# a) write an if-condition that tests whether the matrix "popRoot10" has less rows than matrix "population". Within this if-condition add (print("yes"))


# b) write an if-condition that removes "popRoot10" from the workspace when the matrix "popRoot10" has less rows than matrix "population". Within this if-condition add (print("yes"))


# c) write an if-condition that tests whether t is identical to the value 23. Within this if-condition add (print("yes"))


# d) write an if-else-statement. Test whether t is identical to the value 22. When t is not identical to 22 execute the line "print("t is different from 22")".


# e) create a for-loop where the parameter "t" goes from 1 to 100 in steps of 1. This loop goes from year t=1 to t=100 in steps of years.
#    Then, add an if-condition within this for loop that tests whether t is identical to 22. This allows you to "do something" precisely in year 22.
#    Within this if-condition increase all temperature values of the matrix "population" by +1. Replace the "original" values with these new values. This could refer to a single environmental perturbation in year 22.
#    In addition to that, add "print(t)" within the if condition. This is one way to test if the if-condition works at the right point in time.



# 8. function            (5 points) ####
# a) Define a function with name "aging". Let the sole input parameter be "pop" (which has the same format as "population" as defined previously). 
#    Within this function increase all values of the 2nd column of pop (age) by +1.
#    At last, return the modified matrix "pop" as function output (2 points).


#    Then, use the function "aging" with the input pop=population (0.5 points).


# b) Define a function called "envChange" with input parameters "pop", "tempRise", and "humChange" (2 points).
#    Within this function, multiply all entries of the 3rd column of "pop" by "tempRise" (and store the result in the same column).
#    In addition, add (with a + sign) the value "humChange" to all entries of the 4th column of pop (and store the result in the same column). In other words, increase the column 4 entries by humChange
#    At last, return the modified matrix "pop" as output.


#    use this function with input pop=population, tempRise=1.03, humChange=0.08. (0.5 points)



# 9. dispersal function  (5 points) ####
# Here, you need to "create" a function that performs dispersal of individuals. Assume that individuals disperse with probability "dispProb" to patch 2.
# Define a function called "dispersal" with input parameters "pop" (the population matrix) and "dispProb" (the dispersal probability, with 0.1 representing a 10% chance of dispersing).
# Within this function, add a for loop that cycles from the first to the last row of "pop" (that is r takes all whole numbers (integers) from 1 to row number of pop). 
# Within this for loop, sample a single random value from a uniform distribution between 0 and 1. Store this value under the name "random".
# After picking the random number (still within the for-loop), write an if condition with logical test "random<=dispProb". So you test whether the random number is smaller than dispersal probability.
# Within this if condition, increase the entry of pop in the first column and row "r" by +1. 
# Finally, return the modified matrix pop as function output.


# Execute this function with pop=population and dispPRob=0.42


# If you managed to code this, do you understand how you simulated dispersal ? What does it mean biologically ?

