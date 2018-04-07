# puts all student names into array
def input_students
  cohorts = [
  :january,
  :february,
  :march,
  :april,
  :may,
  :june,
  :july,
  :august,
  :september,
  :october,
  :november,
  :december,
  :unknown
  ]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.gsub(/\s+\z/, "")
  puts "Please enter #{name}'s cohort"
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the students hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: "world domination", country_of_birth: "hell", height: 183}

    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    unless name.empty?
      while true do
        puts "Please enter #{name}'s cohort"
        cohort = gets.chomp

        if cohort == ""
          cohort = :unknown
        end

        if cohorts.include?(cohort.to_sym)
          break
        end
      end
    end
  end
  # return the array of students
  students
end

def group_by_cohort(students)
  cohorts = [
  :january,
  :february,
  :march,
  :april,
  :may,
  :june,
  :july,
  :august,
  :september,
  :october,
  :november,
  :december,
  :unknown
  ]

  sorted_students = students.sort do |first, second|
    cohorts.index(first[:cohort]) <=> cohorts.index(second[:cohort])
  end

  sorted_students
end

# prints the school header
def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------------------------".center(50)
end

# prints a list of students
def print(students)
  student_index = 0
  while student_index < students.count do
    if students[student_index][:name][0].downcase == "r" && students[student_index][:name].length < 12
      puts "#{student_index + 1}. #{students[student_index][:name]} (#{students[student_index][:cohort].capitalize} cohort)".center(50)
      puts "\thobby: #{students[student_index][:hobby]}".center(50)
      puts "\tcountry of birth: #{students[student_index][:country_of_birth]}".center(50)
      puts "\theight: #{students[student_index][:height]} cm".center(50)
    end
    student_index += 1
  end
end

# prints the total number of students
def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
  end
end

students = input_students
grouped_students = group_by_cohort(students)
print_header
print(grouped_students)
print_footer(students)
