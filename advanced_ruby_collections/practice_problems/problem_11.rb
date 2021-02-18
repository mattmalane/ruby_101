arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |array|
  array.select do |num|
    if num % 3 == 0
      num
    end
  end
end




# if num % 3 == 0
#   new_array 