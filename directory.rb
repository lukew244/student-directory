require 'csv'
@students = []

def interactive_menu
	loop do
	print_menu
	process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "Please select a number from the following menu:"
	puts "1. Input the students"
	puts "2. Display student list" 
	puts "3. Save list to a file"
	puts "4. Load list from a file"
	puts "9. Exit"
end

def process(selection)
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "3"
		filename = ask_for_filename
		save_students(filename)
	when "4" 
		filename = ask_for_filename
		load_students(filename)
	when "9"
		exit		
	else 
		puts "Command not recognised, please re-enter:"
	end
end

def input_students
	puts "Please enter the name of a student, or hit return to finish"
	name = STDIN.gets.chomp
	
	while !name.empty? do
		puts "Which cohort is #{name} in?"
		cohort = STDIN.gets.chomp
		cohort = :unspecified if cohort.empty? 		#default value for cohort
	
		import_students_to_hash(name, cohort)
		@students.length > 1 ? puts("Now we have #{@students.count} students") : puts("Now we have #{@students.count} student") 
		puts "Please enter the name of the next student or hit return twice to finish"
		name = STDIN.gets.chomp
	end
end

def show_students
	if @students.length > 0
       	print_header
        print_students
        print_footer
	else
        puts "No names were entered"
	end
end

def center_text(text)
	linewidth = 150
	puts text.center(linewidth)
end

def print_header
	center_text("The students of Villains Academy")
	center_text("---------")
end

def print_students
	@students.each_with_index do |student, index|
	center_text("#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)") 
	end	
end

def print_footer 
	puts
	center_text("Overall we have #{@students.count} great students\n")
end

def save_students(filename = "students.csv")

	CSV.open(filename, "wb") do |csv|
		@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv << student_data
		end
	end
	success_message
end

def try_load_students
	filename = ARGV.first
	return load_students if filename.nil?
	
	if File.exists?(filename)
	load_students(filename)
	puts "Loaded #{@students.count} from #{filename}"
	else 
	puts "File #{filename} does not exist"
	exit 
	end

end

def load_students(filename = "students.csv")

	CSV.foreach(filename) do |row|
	name, cohort = row
	import_students_to_hash(name, cohort)
	end
	success_message
end

def import_students_to_hash(name, cohort)
	@students << {name: name.to_sym, cohort: cohort.to_sym} 
end

def success_message
	puts "Operation completed successfully"
end

def ask_for_filename
	puts "Please specify a filename or hit return to use students.csv"
	filename = STDIN.gets.chomp
	filename = "students.csv" if filename.empty?
	return filename
end



try_load_students
interactive_menu
