greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# The result of greetings is "hi there"
# informal_greeting is referencing the original object id, and << ' there '
# is modifying the original object id of greetings