def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# my_string will display "pumpkins" because += reassigns 'pumpkinrutabaga'
# to a new object id. my_string is still pointing the the original object id

# my_array will display ["pumpkins", "rutabaga"] because << will add reference
# the original object id, adding "rutabaga" to the original id.