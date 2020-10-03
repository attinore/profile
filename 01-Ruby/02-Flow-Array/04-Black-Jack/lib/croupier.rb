require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  return "The score is: #{player_score} | Bank score is: #{bank_score}"
end

def end_game_message(player_score, bank_score)
  if player_score > 21
    return "Lose"
  elsif player_score == 21
    return "Black Jack, you win!"
  elsif player_score > bank_score
    return "Win"
  elsif player_score < bank_score
    return "Lose"
  else
    return "Push! You get your money back."
  end
  # TODO: return (not print!) a message telling if the user won or lost.
end
