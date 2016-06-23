# collects names of students from the user and generates an array of hashes containing student data
def input_students
	puts "Please enter the name of the students"
	puts "Hit return twice to finish"
 
	students = []
	name = gets.chomp
	
	while !name.empty? do
	puts "Which cohort is #{name} in?"
	cohort = gets.chomp
	cohort = :november if cohort.empty? 		#default value for cohort
	
	students << {name: name.to_sym, cohort: cohort.to_sym}
	students.length > 1 ? puts("Now we have #{students.count} students") : puts("Now we have #{students.count} student") 
	puts "Please enter the name of the next student or hit return twice to finish"
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
	students.each_with_index do |student, index|
	center_text("#{index}. #{student[:name]} (#{student[:cohort]} cohort)") 
	end	
end



def print_by_cohort(students)
	cohort_list = []	
	
	students.map do |student|
		cohort_list.push(student[:cohort])
	end

	cohort_list = cohort_list.uniq.sort

	cohort_list.each do |cohort|
		students.each do |student|
			if student[:cohort] == cohort
			center_text("#{student[:name]} #{student[:cohort]}")
			end
		end
	end
end

def print_footer(students) 
	puts
	center_text("Overall we have #{students.count} great students\n")
end

students = input_students

if students.length > 0 
	print_header
	print_by_cohort(students)
	print_footer(students)
else
	puts "No names were entered"
end
