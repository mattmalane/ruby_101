my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

#  - Line 1:
#  - Action: Variable assignment (my_arr)
#  - Object: the return value of the method call (each)
#  - Side Effect: none
#  - Return Value: [[18, 7], [3, 12]]
#  - Is Return Value Used?: no
#  - Line 1:
#  - Action: method call (each)
#  - Object:the outer array
#  - Side Effect: none
#  - Return Value: The calling object
#  - Is Return Value Used?: yes for the variable my_arr
#  - Line 1-7:
#  - Action: block execution
#  - Object: the sub-arrays of the outer array
#  - Side Effect: none
#  - Return Value: the original array
#  - Is Return Value Used?: no
#  - Line 2: 
#  - Action: method call (each)
#  - Object:each sub-array
#  - Side Effect: none
#  - Return Value: sub-array in current iteration
#  - Is Return Value Used?: yes for the outer block's return value
#  - Line 2-6:
#  - Action: block execution
#  - Object: each individual element in each sub-array
#  - Side Effect: none
#  - Return Value: nil
#  - Is Return Value Used?: no
#  - Line 3:
#  - Action: comparison (>)
#  - Object: each individual element in each sub-array
#  - Side Effect: none
#  - Return Value: boolean
#  - Is Return Value Used?: yes evaluated by if
#  - Line 3-5: 
#  - Action: conditional
#  - Object: integer in each sub array
#  - Side Effect: no
#  - Return Value: nil
#  - Is Return Value Used?: yes, used to determine return value of inner block
#  - Line 4:
#  - Action: method call (puts)
#  - Object: num
#  - Side Effect: output of string representation of an integer
#  - Return Value: nil
#  - Is Return Value Used?: yes, by the conditional statement