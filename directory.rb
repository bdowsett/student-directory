
#first put all students in an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort:  :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    students = []
    
    name = gets.chomp
    
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end 
    students
end

def print_header 
  puts "The students of Villians Academy"
  puts "-------------"
end 

def print(students)
students.each_with_index do |student, idx|
    puts "#{idx + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
end 
end

def interactive_menu
    students = []
    loop do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"
        selection = gets.chomp
        
        case selection
        when "1"
            students = input_students
        when "2"
            print_header
            print(students)
            print_footer(students)
        when "9"
            exit
        else 
            puts "I dont know what you meant, try again"
        end 
        
    end 
end 

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end 

=begin
students = input_students
print_header
print(students)
print_footer(students)
=end 

interactive_menu