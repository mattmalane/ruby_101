numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# The code will print out 1, 2, 2, 3 on seperate lines
# uniq does not mutate the numbers array, but returns a seperate array of [1, 2, 3]