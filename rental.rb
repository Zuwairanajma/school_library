# class Rental
#   attr_accessor :date, :book, :person

#   def initialize(date, book, person)
#     @date = date
#     @book = book
#     @person = person

#     person.rentals << self if person
#     book.rentals << self if book
#   end
# end

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @id = generate_id
    @date = date
    @book = book
    @person = person
    # person.rentals << self
    # book.rentals << self
  end

  def to_hash
    {
      id: @id,
      date: @date,
      book: @book,
      person: @person
    }
  end

  private

  def generate_id
    Random.rand(1..1000)
  end
end
