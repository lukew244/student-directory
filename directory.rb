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

def center_text(text)
	linewidth = 150
	puts text.center(linewidth)
end

def print_header
	center_text("The students of Villains Academy")
	center_text("---------")
end

def print(students)
	idx = 0
	while idx < students.length 
	student = students[idx]
	center_text("#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)") 
	idx += 1	
	end
end

def print_footer(students) 
	puts
	center_text("Overall we have #{students.count} great students\n")
end

students = input_students
print_header
print(students)
print_footer(students)
