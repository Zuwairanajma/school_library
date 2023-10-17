require_relative 'nameable'
# require_relative 'rental'
# require_relative 'teacher'

class Person < Nameable
  def initialize(age, parent_permission, name = 'unknown')
    super()

    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # getters
  attr_reader :id, :parent_permission, :rentals
  attr_accessor :name, :age

  def can_use_services?
    return true if of_age?

    false
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_hash
    hash = {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }

    if is_a?(Teacher)
      hash.merge!(specialization: @specialization)
      hash[:specialization] = @specialization
      hash.delete(:parent_permission)
    else
      hash[:parent_permission] = @parent_permission
    end

    hash
  end

  private

  def of_age?
    return true if age >= 18

    false
  end
end
