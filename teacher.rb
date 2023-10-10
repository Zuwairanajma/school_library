require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @specialization = specialization
  end

  # def get_name
  #   @name
  # end

  # def get_age
  #   @age
  # end

  def can_use_services?
    true
  end
end
