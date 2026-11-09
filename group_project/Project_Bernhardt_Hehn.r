# ---------- Group Project for Computational Ecology I ---------
# Topic     : The temporal dynamics of infectious diseases 
# Supervisor: Max Schmid
# Authors   : Adrian Bernhardt, Samuel Hehn

# ----- Define functions for simulation -----

# function to initialize matrix for population N0
# input : N0: Number of individuals in starting population
# output: Matrix containing population N0, all in 'susceptible' state
init_pop <- function(N0) {
    pop_matrix <- matrix(data=c(rep("susceptible", N0)),
                         nrow=N0,
                         ncol=1,
                         dimnames=list(NULL, "state")
                        )
    return (pop_matrix)
}

# function to initialize statistics object for starting population N0
# input : N0: Number of individuals in starting population
# output: Statistics object containing initial statistics for day 0
init_statistics <- function(N0) {
    statistics <- matrix(data=c(0, N0, 0, 0),
                         nrow=1,
                         ncol=4,
                         dimnames=list(NULL, c("day", "susceptible", "infected", "recovered"))
                        )
    return (statistics)
}

# TODO: 
# function to introduce disease into healthy population. For now, randomly infect 1% of population
# input : pop_matrix: matrix of individuals in a population
# output: population matrix with updated infection states
init_disease <- function(pop_matrix) {
    # calculate n.o. individuals to be infected, random sample those and infect
    n_infected <- round(nrow(pop_matrix) * 0.01)
    i_infected <- sample(seq_len(sum(pop_matrix[pop_matrix[,"state"] == "susceptible"))), n_infected)
    pop_matrix[i_infected, "state"] = "infected"

    return (pop_matrix)
}

# function to recover infected individuals by chance
# input : pop_matrix: 
#                  y: probability of recovery
# output: population matrix with updated recovery states
recovery <- function(pop_matrix, y) {
    # check if y is in range 0 to 1
    if (y < 0 || y > 1) {
        stop(paste0("Invalid value for y: ", y, ". Value is a probability and must lie between 0 and 1"))
    }

    # loop through infected individuals and check if one recovers
    for (i in which(pop_matrix[,"state"] == "infected")) {
        r <- runif(n=1, min=0, max=1)
        if (r <= y) {
            pop_matrix[i,"state"] <- "recovered"
        }
    }
    return (pop_matrix)
}

# function for infected individuals to infect susceptible individuals by chance
# input : pop_matrix: matrix of individuals in a population
#                  c: number of "potentially infectious contacts" per day
#                  a: probability of infection of susceptible, if in contact with infected individual
# output: population matrix with updated infection states
infection <- function(pop_matrix, c, a) {
    # check if c and a are in range 0 to 1
    if (c < 0 || a < 0 || a > 1) {
            stop(paste0("Invalid values in a: ", a, " or c: ", c, ". a is a probability and must lie between 0 and 1. c is the number of contacts per day and must be greater or equal to 0"))
        }
    
    # loop through every infected individual and extract contacts c
    for (i in which(pop_matrix[,"state"] == "infected")) {
        contacts <- sample(setdiff(seq_len(nrow(pop_matrix)), i), c)
        
        # loop through contacts with susceptible individuals and check if infection happens
        for (j in contacts) {
            r <- runif(n=1, min=0, max=1)
            if (pop_matrix[j, "state"] == "susceptible" && r <= a) {
                pop_matrix[j,"state"] <- "infected"
            }
        }
    }
    return (pop_matrix)
}

# function initializing population and statistics and run the simulation on given parameters
# input : days: number of days the simulation should be run 
#           N0: number of individuals in starting population
#            y: probability of recovery
#            c: number of "potentially infectious contacts" per day
#            a: probability of infection of susceptible, if in contact with infected individual 
# output: list of final population matrix and statistics object
simulate <- function(days, N0, y, c, a) {
    # check if N0 and days are valid
    if (N0 <= 0 || days <= 0) {
        stop(paste0("Invalied values in N0: ", N0, " or days: ", days , ". Values must be natural numbers greater than 0"))
    }

    # initialize population and statistics
    pop <- init_pop(N0)
    stats <- init_statistics(N0)

    # simulate daily events
    for (t in 1:days) {
        # update population matrix
        pop <- recovery(pop, y)
        pop <- infection(pop, c, a)

        # TODO: adjust initial infection
        if (t <= 5) {
            pop <- init_disease(pop)
        }

        # update statistics
        stats <- rbind(stats,
                       c(t, sum(pop[,"state"] == "susceptible"), sum(pop[,"state"] == "infected"), sum(pop[,"state"] == "recovered"))
                      )
    }
    return (list(population=pop, statistics=stats))
}

# ----- Perform simulation and gather statistics ----- 

# test simulation
simulate(30, 1000, 0.4, 6, 0.3)