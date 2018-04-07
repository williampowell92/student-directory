require 'csv'
@students = [] # an empty array accessible to all methods

def add_to_students(name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

def enter_student_names(name)
  while !name.empty? do
    add_to_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  enter_student_names(name)
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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def get_filename
  puts "Please enter a file name."
  puts "Hit return to use the students.csv"
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

def save_students(filename = "students.csv")
  CSV.open(filename, "w") do |student_database|
    @students.each do |student|
      student_database << [student[:name], student[:cohort]]
    end
  end
  puts "Students successfully saved."
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    name, cohort = line
    add_to_students(name, cohort.to_sym)
  end
  puts "Students succesfully loaded."
end

def try_load_students
  ARGV.first != nil ? filename = ARGV.first : filename = "students.csv"
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
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
