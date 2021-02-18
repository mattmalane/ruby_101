[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
#[2, 4]
#[6, 8]

#  - Line 1:
#  - Action: method call(map)
#  - Object: the outer array
#  - Side Effect: none
#  - Return Value: [2, 4] [6, 8]
#  - Is Return Value Used?: no
#  - Line 1-5:
#  - Action: block execution
#  - Object: each subarray
#  - Side Effect: none
#  - Return Value: new transformed array
#  - Is Return Value Used?: yes, top level map for transformation
#  - Line 2:
#  - Action: method call (map)
#  - Object: the elements in each subarray
#  - Side Effect: none
#  - Return Value: new transformed array
#  - Is Return Value Used?: yes, used to determine outer block's return value
#  - Line 2-4:
#  - Action: block execution
#  - Object: the elements in each subarray
#  - Side Effect: none
#  - Return Value: 2, 4, 6, 8
#  - Is Return Value Used?: yes 
#  - Line 3: 
#  - Action: method call * with integer 2 as an argument
#  - Object: each element in each subarray
#  - Side Effect: returns the element * 2
#  - Return Value: 2, 4, 6, 8
#  - Is Return Value Used?: Yes for transformationreturn value of inner block