['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# each_with_object will return a hash with all of the original elements
# the key will be the first letter of the element due to [value[0]] and the 
# value will be the corresponding value