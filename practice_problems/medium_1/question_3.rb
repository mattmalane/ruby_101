while divisor > 0
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end