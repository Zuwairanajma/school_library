class Student < Person
   attr_accessor :classroom
   
   def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
   end

   def play_hooky
    returns "¯\(ツ)/¯"
   end
end