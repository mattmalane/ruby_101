[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
# Each method is being called on a nested array
# The inner arrays are being passed to the variable arr, with the first metho
# being called on the array. returning the first element in the array ( [0])
# puts being called on the return value => nil
# the each method returns the original array. [[1, 2], [3, 4]]