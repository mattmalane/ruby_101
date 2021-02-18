[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

# Line 1:
#  - Action: method call (map)
#  - Object: the outer array
#  - Side Effect: none
#  - Return Value: new array [nil, nil]
#  - Is Return Value Used?: no, but shown on line 6
# Line 1-3:
#  - Action: block execution
#  - Object: each sub-array
#  - Side Effect: none
#  - Return Value: nil
#  - Is Return Value Used?: Yes, used by map for transformation
# Line 2: 
#  - Action: method call (first)
#  - Object: each sub array
#  - Side Effect: none
#  - Return Value: element at index 0 of sub-array
#  - Is Return Value Used?: yes, used by puts
# Line 2:
#  - Action: method call (puts)
#  - Object: element at index 0 of each sub-array
#  - Side Effect: outputs a string representation of an integer
#  - Return Value: nil
#  - Is Return Value Used?: yes, used to determine return value of block
