require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'user_inputs'

class App
  attr_reader :books, :person, :rentals, :classroom

  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  # Methods to list books and people
  def list_all_books()
    puts 'All Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people()
    puts 'All People:'
    @person.each do |person|
      puts "#{person.class}, Name: #{person.name}, age: #{person.age}"

      if person.instance_of?(Teacher)
        puts "Specialization: [#{person.specialization}]"
      else
        puts "Permission: #{person.parent_permission}"
      end
    end
  end

  def create_person()
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    is_student = UserInput.self_get

    case is_student
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  # private

  def create_student
    name = UserInput.get_input('Enter person name:')
    age = UserInput.self_get('Enter person age:')
    permission = UserInput.user_permission('Does student have parent permission [Y/N]: ')

    student = Student.new(1, age, permission, name)
    @person << student
    puts 'Student created successfully.'
  end

  def create_teacher
    name = UserInput.get_input('Enter person name:')
    age = UserInput.self_get('Enter person age:')
    specialization = UserInput.get_input('What is the teachers specialization: ')
    teacher = Teacher.new(age, specialization, name)
    @person << teacher
    puts 'Teacher created successfully.'
  end

  # Creating book method
  def create_book
    title = UserInput.get_input('Enter book title:')
    author = UserInput.get_input('Enter book author:')

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  # Creating rental method

  def create_rental
    puts 'select a book by number'
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book.title}, Author: #{book.author}"
    end

    book_index = UserInput.self_get
    puts 'select a person by number'
    @person.each_with_index do |person, index|
      print "#{index} - #{person.class}, Name: #{person.name}"

      if person.instance_of?(Teacher)
        puts "  Specialization: #{person.specialization}"
      else
        puts "  Parent Permission: #{person.parent_permission}"
      end
    end

    person_index = UserInput.self_get
    puts 'Enter date:'
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @person[person_index])
    @rentals << rental
    puts 'Rental created successfully.'
  end

  # Listing rentals method
  def list_rentals_for_person
    puts 'All Rentals:'
    @rentals.each do |rental|
      if rental.person
        puts "id of person: #{rental.person.id}"
        puts "Name: #{rental.person.name}"
      else
        puts 'Person information not available for this rental.'
      end
    end
    puts 'Select ID:'
    id = UserInput.self_get
    rentals_found = @rentals.select { |rental| rental.person.id == id }

    if rentals_found.empty?
      puts 'No rentals found for the specified ID.'
    else
      puts 'All Rentals for this ID:'
      rentals_found.each do |rental|
        puts "Date: #{rental.date}, Title: #{rental.book.title}, Author: #{rental.book.author}"
      end
    end
  end
end
