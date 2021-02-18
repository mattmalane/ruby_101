[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# the block will return a boolean value of true. any return true if the block returns true