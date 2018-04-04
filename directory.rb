# puts all student names into array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratches",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
  "Jean-Ralphio Saperstein"
  ]

# prints a list of students
puts "The students of Villains Academy"
puts "--------------------------------"
students.each do |student|
  puts student
end
# prints the total number of students
puts "Overall, we have #{students.count} great students"
