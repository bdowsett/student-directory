@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    name = gets.chomp
    
    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} student#{"s" if @students.count != 1}"
        name = gets.chomp
    end 
    @students
end

def print_header 
  puts "The students of Villians Academy"
  puts "-------------"
end 

#def print_students_list
#@students.each_with_index do |student, idx|
   # puts "#{idx + 1}: #{student[:name]} (#{student[:cohort]} cohort)" 
#end 
#end

#----test

def print_students
  count = 0
  while count < @students.length
    puts "#{@students[count][:name]} (#{@students[count][:cohort]} cohort)"
    count += 1
  end
end

#---------



def students_by_name 
    puts "enter a letter to search"
    letter = gets.chomp.upcase
    @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].upcase.start_with?(letter)}
end 

def students_by_length
    puts "enter a length"
    number = gets.chomp.to_i
    @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < number}
end 

def print_menu 
     puts "1. Input the students"
     puts "2. Show the students"
     puts "3. Save the list to students.csv"
     puts "4. Load the list from students.csv"
     puts "5. Student by first letter"
     puts "6. Student name by length"
     puts "9. Exit"
end 

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
        save_students
    when "4"
        load_students
    when "5"
        students_by_name
    when "6"
        students_by_length
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do|student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
end 
file.close
end 

def load_students
    file = File.open("students.csv", "r")
    file.readlines.each do |line| 
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end 
    file.close
end 


def show_students
    print_header 
    print_students
    print_footer 
end 

def interactive_menu
    #students = []
    loop do
        print_menu
        process(gets.chomp)
    end 
end 

def print_footer
puts "Overall, we have #{@students.count} great students"
end 


interactive_menu