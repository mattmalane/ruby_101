[1, 2, 3].reject do |num|
  puts num
end

# the return value of reject will return a new array of the original elements
# it does this when the return value of the block is nil or false