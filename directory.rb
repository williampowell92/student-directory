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

# prints the school header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
# prints a list of students
def print(names)
  names.each do |name|
    puts name
  end
end
# prints the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
