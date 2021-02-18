{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# the return value of map will be [nil, 'bear']
# map executes the block for each element
# the block will return [nil, 'bear']
