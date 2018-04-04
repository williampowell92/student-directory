# puts all student names into array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the students hash to the array
    students << {name: name, cohort: :november, hobby: "world domination", country_of_birth: "hell", height: 183}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

# prints the school header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# prints a list of students
def print(students)
  student_index = 0
  while student_index < students.count do
    if students[student_index][:name][0].downcase == "r" && students[student_index][:name].length < 12
      puts "#{student_index + 1}. #{students[student_index][:name]} (#{students[student_index][:cohort]} cohort)"
      puts "\thobby: #{students[student_index][:hobby]}"
      puts "\tcountry of birth: #{students[student_index][:country_of_birth]}"
      puts "\theight: #{students[student_index][:height]} cm"
    end
    student_index += 1
  end
end

# prints the total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
