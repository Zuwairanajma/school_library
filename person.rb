require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  def initialize(age, parent_permission, name = 'Unknown')
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

  private

  def of_age?
    return true if age >= 18

    false
  end
end
