[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# select will return a new array of selected elements based on the block
# all? returns true only when the block never returns false
# in the first array, b; 'elephant' returns false, so even though a: 'ant'
# returns true, it returns false
# if we used any? , the first hash in the array would also be selected and 
# returned in a new hash. The any? method returns true when any of the return values
# are true.