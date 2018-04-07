require 'csv'
@students = []

def add_to_students(name, cohort = :"April 2018")
  @students << {name: name, cohort: cohort}
end

def show_student_count
  puts "Now we have #{@students.count} students"
end

def enter_student_names
  name = STDIN.gets.chomp
  while !name.empty? do
    add_to_students(name)
    show_student_count
    name = STDIN.gets.chomp
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  enter_student_names
  puts "Students succesfully inputted."
end

def print_header
  if @students.count > 0
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
  else
    puts "There are no students."
  end
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students" if @students.count > 0
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def get_filename
  puts "Please enter a file name."
  puts "Hit return to use students.csv"
  file_name = STDIN.gets.chomp
  file_name == "" ? "students.csv" : file_name
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students(get_filename)
    when "4"
      load_students(get_filename)
    when "9"
      puts "Goodbye!"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students(filename)
  CSV.open(filename, "w") do |student_database|
    @students.each do |student|
      student_database << [student[:name], student[:cohort]]
    end
  end
  puts "Students successfully saved."
end

def print_students_loaded(filename)
  case @students.count
    when 0 then puts "No students loaded."
    when 1 then puts "Loaded 1 student from #{filename}."
    else puts "Loaded #{@students.count} students from #{filename}."
  end
end

def load_students(filename)
  CSV.foreach(filename) do |line|
    name, cohort = line
    add_to_students(name, cohort.to_sym)
  end
  print_students_loaded(filename)
end

def try_load_students
  ARGV.first != nil ? filename = ARGV.first : filename = "students.csv"
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

interactive_menu
