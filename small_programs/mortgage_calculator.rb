def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt("Welcome to Mortgage Calculator!")

  loan_amount = ''
  loop do
    prompt("What is the amount of your loan?")
    loan_amount = gets.chomp.to_f

    if loan_amount.to_i <= 0
      prompt("Please enter a number greater than 0.")
    else
      break
    end
  end

  apr = ''
  loop do
    prompt("What is your Annual Percentage Rate (APR)?")
    apr = gets.chomp.to_f

    if apr.to_i <= 0
      prompt("Please enter a number greater than 0.")
    else
      break
    end
  end

  loan_in_years = ''
  loop do
    prompt("What is the loan duration? (10, 20, 30)")
    loan_in_years = gets.chomp.to_f

    if loan_in_years.to_i <= 0
      prompt("Please enter a number greater than 0")
    else
      break
    end
  end

  monthly_interest = (apr / 100.0) / 12.0
  loan_in_months = loan_in_years * 12.0

  monthly_payment = loan_amount *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(-loan_in_months.to_f)))

  prompt("Your monthly payment is $#{monthly_payment.to_i}")

  prompt("Would you like to make another calculation? (Y/N)")
  answer = gets.chomp

  break unless answer.downcase == 'y'
end

prompt("Thank you for using Mortgage Calculator!")
prompt("Goodbye!")
