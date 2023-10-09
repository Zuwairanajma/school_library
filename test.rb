require_relative 'classroom'
require_relative 'student'

# Example Usage:

classroom_a = Classroom.new("Class A")
classroom_b = Classroom.new("Class B")

student_1 = Student.new(18, classroom_a, "john")
student_2 = Student.new(20, classroom_b, "Janet")

classroom_a.add_student(student_1)
classroom_b.add_student(student_2)

puts "Classroom A Students: #{classroom_a.students.map(&:name).join(', ')}"
puts "Classroom B Students: #{classroom_b.students.map(&:name).join(', ')}"

puts "#{student_1.name} is in #{student_1.classroom&.label}"
puts "#{student_2.name} is in #{student_2.classroom&.label}"
