require_relative "wagon_sort"

list = []

puts "Type a student name:"
students = gets.chomp
list.push(students) unless students == ""

until students == ""
  puts "Type another student name or press enter to finish:"
  students = gets.chomp
  list.push(students) unless students == ""
end

puts "Congratulations! Your Wagon has #{list.count} students:"
puts "#{wagon_sort(list)[0]}, #{wagon_sort(list)[1...-1].join(', ')} and #{wagon_sort(list).last}"
