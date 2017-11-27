# Intermediate

#------------ Relational Operators ----------------------

# <  >  ==  != <=  >=

# "Hello" > "Goodbye" : alphabetical order

# TRUE < FALSE : TRUE is 1 FALSE IS 0

# vector, matrix -scalar comparison
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
linkedin > 10
#[1]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE

# vector-vectore comparison
facebook <- c(17, 7, 5, 16, 8, 13, 14)
facebook <= linkedin
#[1] FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE

# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-6*14 != 17-101

# Comparison of character strings
"useR" == "user"

# Compare a logical with a numeric
TRUE == 1


#------------------Logical Operators-----------------------
& |

> TRUE & TRUE
[1] TRUE
> FALSE & TRUE
[1] FALSE
> FALSE | TRUE
[1] TRUE
> 5 <= 5 & 2<3
[1] TRUE
> 3<4 | 7<6
[1] TRUE

# The social data (linkedin, facebook, views) has been created for you

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12

# When is views between 11 (exclusive) and 14 (inclusive)?
views > 11 & views <= 14


#--------Conditional Statements------------------------------------
#-----(1) if statement ----------
# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
  print("Try to be more visible!")
}

# Initialize the speed variable
speed <- 88

#---------(2) while loop---------------
while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if (speed > 80 ) {
    break
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print(3*i)
  if (3*i%%8==0) {
  break
  }
  i <- i + 1
}

# nchar(): number of characters in a string

#-------- (3) for loop -------------------
# next : skip to next iteration

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

#Loop over a vector----------------
# Loop version 1
for (views in linkedin) {
  print(views)
}

# Loop version 2
for (i in 1:length(linkedin)) {
  print(linkedin[i])
}

#Loop over a list------------------
# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (nycinfo in nyc) {
  print(nycinfo)
}

# Loop version 2
for (i in 1:length(nyc)) {
  print(nyc[[i]])
}

# paste() : Concatenate vectors after converting to character.

# The tic-tac-toe matrix ttt has already been defined for you

# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row ", i, " and column", j, " the board contains", ttt[i,j]))
  }
}

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
  if (li > 10 ) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  print(li)
}

# The break statement abandons the active loop: 
# the remaining code in the loop is skipped and the loop is not iterated over anymore.
# The next statement skips the remainder of the code in the loop, but continues the iteration.

for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")  
    break
    }

  # Add if statement with next
    if (li < 5) {
    print("This is too embarrassing!")
    next
  }
  
  print(li)
}

#==================Functions-======================================
help(sd)  or ?sd
args(function) # Displays the argument names and corresponding default values of a function or primitive.
#e.g. args(sd)

sd(x, na.rm = FALSE )

values <- c(1, 5, 6, NA)
sd(values) # NA because it did not remove NA by default

mean()  #average
mean(x, trim = 0, na.rm = FALSE, ...)

> # The linkedin and facebook vectors have already been created for you
> linkedin <- c(16, 9, 13, 5, NA, 17, 14)
> facebook <- c(17, NA, 5, 16, 8, 13, 14)
> 
> # Basic average of linkedin
> mean(linkedin)
[1] NA
> 
> # Advanced average of linkedin
> mean(linkedin, na.rm = TRUE)
[1] 12.33333


# Defining Functions
my_fun <- function(arg1, arg2) {
  body
}

# Create a function pow_two()
pow_two <- function(x) {
  x^2
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(x, y) {
  abs(x) + abs(y)
}

# Use the function
sum_abs(-2, 3)

# Define the function hello()
hello <- function() {
  print("Hi there!")
  TRUE
}

# Call the function hello()
hello()

my_fun <- function(arg1, arg2 = val2) {  #val2 is the default
  body
}

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if (print_info == TRUE)
    print(paste(x, "to the power two equals", y))
  return(y)
}

pow_two(2, F)

 # function scoping : variables that are defined inside a function
 # are not accessible outside that function.

 #R passes arguments by value
 triple <- function(x) {
  x <- 3*x
  x
}
a <- 5
triple(a)
a  # a is still 5

# Define the interpret function
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)

  } else {
      print("Try to be more visible!")
      return(0)
  }
}

# Call the interpret function twice
interpret(linkedin[1])
interpret(facebook[2])

install.packages("ggvis")   #installs package
search()
library("ggvis")  #loads the package
require()  #loads package when not installed

# Load the ggplot2 package
library("ggplot2")

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()


#============== Apply Family ===========================================================
#=================================================================================
#==================lapply=============================================
lapply(X, FUN, ...)
# lapply takes a vector or list X, and applies the function FUN to each of its members. 
# If FUN requires additional arguments, you pass them after you've specified X and FUN (...).

#The output of lapply() is a list, the same length as X, 
# where each element is the result of applying FUN on the corresponding element of X

# The output is a LIST

#!! NO NEED TO APPLY FOR LOOP FOR EACH ELEMENT!!!

strsplit()
tolower()  # to lowercase letters

# Named function
triple <- function(x) { 3 * x }

# Anonymous function with same implementation
function(x) { 3 * x }

# Use anonymous function inside lapply()
lapply(list(1,2,3), function(x) { 3 * x })

multiply <- function(x, factor) {
  x * factor
}
lapply(list(1,2,3), multiply, factor = 3)


#---------- Example with pioneers vector -----------------------------
# The vector pioneers 
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(y) {
  y[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(x) {x[1]})

# Transform: use anonymous function inside lapply
years <- lapply(split_low, function(x) {x[2]})

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)

#======================sapply=========================================
# Since the results of lapply are in list, 
# can apply unlist(lapply(...)) to unlist (put them into vector/matrix).

# Instead, use "sapply" if the formats are uniform that list is not needed.
# Names come out as default.

# temp, that contains temperature measurements for 7 days. temp is a list of length 7, 
# where each element is a vector of length 5, representing 5 measurements on a given day.

> temp
[[1]]
[1]  3  7  9  6 -1

[[2]]
[1]  6  9 12 13  5

[[3]]
[1]  4  8  3 -1 -3

[[4]]
[1]  1  4  7  2 -2

[[5]]
[1] 5 7 9 4 2

[[6]]
[1] -3  5  8  9  4

[[7]]
[1] 3 6 9 4 1

# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)

# What if the function returns a vector?

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)
# It returns a matrix (simplifies) :
#    [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#min   -1    5   -3   -2    2   -3    1
#max    9   13    8    7    9    9    9

# Apply extremes() over temp with lapply()
lapply(temp, extremes)
# As usual, this returns a list.

#### What if it cannot simplify? It returns same result as lapply.

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_s, freezing_l)
# TRUE

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp, print_info)

# Apply print_info() over temp using lapply()
lapply(temp, print_info)

# Returns NULL values

#=================== vapply ===============================

lapply()  # apply function over list or vector, output = list
sapply()  # apply function over list or vector, output = array otherwise list => bit dangerous
vapply()  # apply function over list or vector, output = specify => safer

vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)

# there are cases where the structure of the output of the function you want to apply, FUN, 
# does not correspond to the template you specify in FUN.VALUE. 
# In that case, vapply() will throw an error that informs you about 
# the misalignment between expected and actual output.

# temp is already available in the workspace

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp, basics, FUN.VALUE = numeric(3))

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))


#==================== Utilities ============================================
#===========================================================================


# abs(): Calculate the absolute value.
# sum(): Calculate the sum of all the values in a data structure.
# mean(): Calculate the arithmetic mean.
# round(): Round the values to 0 decimal places by default. 
#Try out ?round in the console for variations of round() and ways to change the number of digits to round to.


# seq(): Generate sequences, by specifying the from, to, and by arguments.
# rep(): Replicate elements of vectors and lists.
# sort(): Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
# rev(): Reverse the elements in a data structures for which reversal is defined.
# str(): Display the structure of any R object.
# append(): Merge vectors or lists.
# is.*(): Check for the class of an R object.
# as.*(): Convert an R object from one class to another.
# unlist(): Flatten (possibly embedded) lists to produce a vector.

# The linkedin and facebook lists
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)

# Sort social_vec
print(sort(social_vec, decreasing = TRUE))

rep(seq(1, 7, by = 2), times = 7)

# Create first sequence: seq1
seq1 <- seq(1, 500, by = 3)

# Create second sequence: seq2
seq2 <- seq(1200, 900, by = -7)

# Calculate total sum of the sequences
print(sum(append(seq1, seq2)))


#================= Regular Expressions =================================

# regular expressions can be used to see whether a pattern exists inside a character string 
# or a vector of character strings


# grepl(), which returns TRUE when a pattern is found in the corresponding character string.
# grep(), which returns a vector of indices of the character strings that contains the pattern.

animals <- c("cat", "moose", "impala", "ant", "kiwi")

grepl(pattern = "a", x = animals)
grepl(pattern = "^a", x = animals)
grepl(pattern = "a$", x = animals)

[1]  TRUE FALSE  TRUE  TRUE FALSE
[1] FALSE FALSE FALSE  TRUE FALSE
[1] FALSE FALSE  TRUE FALSE FALSE

grepl(pattern = "a", x = animals)
grep(pattern = "a", x = animals)
which(grepl(pattern = "a", x = animals))
grep(pattern = "^a", x = animals)

[1]  TRUE FALSE  TRUE  TRUE FALSE
[1] 1 3 4
[1] 1 3 4
[1] 4

# The emails vector 
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
print(grepl(pattern = "edu", x = emails))
[1]  TRUE  TRUE FALSE  TRUE  TRUE FALSE

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern = "edu", x = emails)
> hits
[1] 1 2 4 5

# Subset emails using hits
emails[hits]
[1] "john.doe@ivyleague.edu"   "education@world.gov"     
[3] "invalid.edu"              "quant@bigdatacollege.edu"

# The emails vector 
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
print(grepl(pattern = "@.*\\.edu$", x = emails))
[1]  TRUE FALSE FALSE FALSE  TRUE FALSE

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep(pattern = "@.*\\.edu$", x = emails)
> hits
[1] 1 5

# Subset emails using hits
emails[hits]
[1] "john.doe@ivyleague.edu"   "quant@bigdatacollege.edu"

# sub() and gsub() take it one step further: you can specify a replacement argument

# Use sub() to convert the email domains to datacamp.edu
sub(pattern = "@.*\\.edu$", "@datacamp.edu", x = emails)


# .*: A usual suspect! It can be read as "any character that is matched zero or more times".
# \\s: Match a space. The "s" is normally a character, escaping it (\\) makes it a metacharacter.
# [0-9]+: Match the numbers 0 to 9, at least once (+).
# ([0-9]+): The parentheses are used to make parts of the matching string available to define t
#he replacement. The \\1 in the replacement argument of sub() gets set to the string that is captured by the regular expression [0-9]+.
# regular expression : https://regex101.com

#==================Time & Dates===================================================
#=================================================================================

# Get the current date: today
today <- Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now <- Sys.time()

# See what now looks like under the hood
unclass(now)


# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)


# %H: hours as a decimal number (00-23)
# %I: hours as a decimal number (01-12)
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator

# For a full list of conversion symbols, consult the strptime documentation 

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
> format(date1, "%A")
[1] "Thursday"
> format(date2, "%d")
[1] "15"
> format(date3, "%b %Y")
[1] "Jan 2006"

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2, format = "%Y-%m-%d %H:%M:%S")

# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

diff()  # differences between elements

# day1, day2, day3, day4 and day5 are already available in the workspace

# Difference between last and first pizza day
as.Date(day5)-as.Date(day1)

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
print(mean(day_diff))


# login and logout are already defined in the workspace
# Calculate the difference between login and logout: time_online
time_online <- logout - login

# Inspect the variable time_online
print(time_online)

# Calculate the total time online
print(sum(time_online))

# Calculate the average time online
print(mean(time_online))

# Convert astro to vector of Date objects: astro_dates
astro_dates <- as.Date(astro, format = "%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, format = "%B %d, %y")

# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(astro_dates - meteo_dates))