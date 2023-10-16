# student.rb
require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
