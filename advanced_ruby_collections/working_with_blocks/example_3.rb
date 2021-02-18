[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

#  - Line 1:
#  - Action: method call (map)
#  - Object: Outer array
#  - Side Effect: none
#  - Return Value: new array
#  - Is Return Value Used?: no
#  - Line 1-4:
#  - Action: block execution
#  - Object: each of the sub arrays
#  - Side Effect: none 
#  - Return Value: element at index 0 of each sub-array
#  - Is Return Value Used?: used by map for transformation
#  - Line 2:
#  - Action: method call (first)
#  - Object: each subarray
#  - Side Effect: none
#  - Return Value: each element at index 0 of the sub-arrays
#  - Is Return Value Used?: yes, by puts
#  - Line 2:
#  - Action: method call (puts)
#  - Object: The element at index 0 of each sub-array
#  - Side Effect: outputs string representation of an integer
#  - Return Value: nil
#  - Is Return Value Used?: no, not on the last line of the block
#  - Line 3:
#  - Action: method call(first)
#  - Object: each subarray
#  - Side Effect: none
#  - Return Value: the element at index 0 of each sub-array
#  - Is Return Value Used?: yes, determines the return value of the block
