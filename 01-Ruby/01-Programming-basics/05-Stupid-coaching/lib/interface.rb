require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

puts "Say something to your coach"
your_message = gets.chomp

until your_message == "I am going to work right now!"
  puts coach_answer_enhanced(your_message)
  puts "Say something to your coach"
  your_message = gets.chomp
end
