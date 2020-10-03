require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

player_score = 0
bank_score = pick_bank_score
yes = ['yes', 'y']
running = true

while running
  puts "Card? 'y' or 'yes' to get a new card."
  answer = gets.chomp
  if yes.include?(answer)
    player_score += pick_player_card
    puts state_of_the_game(player_score, bank_score)
    running = player_score < 21
  else
    running = false
  end
end
puts end_game_message(player_score, bank_score)
