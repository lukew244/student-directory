@students = []

def interactive_menu
	loop do
	print_menu
	process(gets.chomp)
	end
end

def print_menu
	puts "Please select a number from the following menu:"
	puts "1. Input the students"
	puts "2. Display student list" 
	puts "3. Save list to students.csv"
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
	when "9"
		exit		
	else 
		puts "Command not recognised, please re-enter:"
	end
end

def input_students
	puts "Please enter the name of the students"
	puts "Hit return twice to finish"

	name = gets.chomp
	
	while !name.empty? do
	puts "Which cohort is #{name} in?"
	cohort = gets.chomp
	cohort = :november if cohort.empty? 		#default value for cohort
	
	@students << {name: name.to_sym, cohort: cohort.to_sym}
	@students.length > 1 ? puts("Now we have #{@students.count} students") : puts("Now we have #{@students.count} student") 
	puts "Please enter the name of the next student or hit return twice to finish"
	name = gets.chomp
	end
end

def show_students
if @students.length > 0
        print_header
        print_students_by_cohort
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
	center_text("#{index}. #{student[:name]} (#{student[:cohort]} cohort)") 
	end	
end

def print_students_by_cohort
	cohort_list = []	
	
	@students.map do |student|
		cohort_list.push(student[:cohort])
	end

	cohort_list = cohort_list.uniq.sort

	cohort_list.each do |cohort|
		@students.each do |student|
			if student[:cohort] == cohort
			center_text("#{student[:name]} #{student[:cohort]}")
			end
		end
	end
end

def print_footer 
	puts
	center_text("Overall we have #{@students.count} great students\n")
end

def save_students
	file = File.open("students.csv", "w")

	@students.each do |student|
	student_data = [student[:name], student[:cohort]]
	csv_line = student_data.join(",")
	file.puts(csv_line)
	end

	file.close
end



interactive_menu
