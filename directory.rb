# collects names of students from the user and generates an array of hashes containing student data
def input_students
	puts "Please enter the name of the students"
	puts "Hit return twice to finish"
 
	students = []
	name = gets.chomp
	
	while !name.empty? do
	students << {name: name, cohort: :november}
	puts "Now we have #{students.count} students"
	name = gets.chomp
	end

	return students
end

def print_header
	puts "The students of Villains Academy"
	puts "---------"
end

def print(students)
	students.each_with_index do |student, index| 
	first_letter = student[:name][0].upcase
	puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if first_letter == "A"
	end
end

def print_footer(students) 
	puts "Overall we have #{students.count} great students\n"
end

students = input_students
print_header
print(students)
print_footer(students)
