require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
# require_relative 'classroom'
# require_relative 'student'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()

    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    age >= 18
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

# Example Usage:

# classroom_a = Classroom.new("Class A")
# classroom_b = Classroom.new("Class B")

# student_1 = Student.new(18, "John")
# student_2 = Student.new("Alice")

# classroom_a.add_student(student_1)
# classroom_b.add_student(student_2)

# puts "Classroom A Students: #{classroom_a.students.map(&:name).join(', ')}"
# puts "Classroom B Students: #{classroom_b.students.map(&:name).join(', ')}"

# puts "#{student_1.name} is in #{student_1.classroom&.label}"
# puts "#{student_2.name} is in #{student_2.classroom&.label}"
