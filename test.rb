require_relative 'classroom'
require_relative 'student'

# Example Usage:

classroom_a = Classroom.new('Class A')
classroom_b = Classroom.new('Class B')

student1 = Student.new(18, classroom_a, 'John')
student2 = Student.new(20, classroom_b, 'Janet')

classroom_a.add_student(student1)
classroom_b.add_student(student2)

puts "Classroom A Students: #{classroom_a.students.map(&:name).join(', ')}"
puts "Classroom B Students: #{classroom_b.students.map(&:name).join(', ')}"

puts "#{student1.name} is in #{student1.classroom&.label}"
puts "#{student2.name} is in #{student2.classroom&.label}"
