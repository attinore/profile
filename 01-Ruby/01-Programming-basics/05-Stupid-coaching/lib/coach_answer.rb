def coach_answer(your_message)
  if your_message.include? "?"
    return "Silly question, get dressed and go to work!"
  elsif your_message.include? "I am going to work right now!"
    return ""
  else
    return "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  case your_message
  when "I AM GOING TO WORK RIGHT NOW!"
    ""
  when your_message.upcase
    "I can feel your motivation! #{coach_answer(your_message)}"
  else coach_answer(your_message)
  end
end
