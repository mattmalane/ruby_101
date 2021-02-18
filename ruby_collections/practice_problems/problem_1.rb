[1, 2, 3].select do |num|
  num > 5
  'hi'
end

#the return value of select will return a new array with the original elements
#of the first array. The blocks return value is 'hi', which is truthy, so
#based on the return value of the block being truthy, the return in a new
#array of the original elements