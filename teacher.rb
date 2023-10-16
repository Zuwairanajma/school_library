require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(age, true, name)
    @specialization = specialization
  end

  def to_hash
    super.merge(specialization: @specialization)
  end

  def can_use_services?
    true
  end
end
