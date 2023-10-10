require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

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
    puts 'press 1 for student, 2 for teacher'
    is_student = gets.chomp.to_i
    puts 'Enter person name:'
    name = gets.chomp
    puts 'Enter person age:'
    age = gets.chomp.to_i

    case is_student
    when 1 
        puts 'Does student have parent permission [Y/N]: '
        permission = gets.chomp.downcase == 'y'
        student = Student.new(1, age, permission, name)
        @person << student

    when 2
        print 'What is the teachers specialization: '
        specialization = gets.chomp
        teacher = Teacher.new(age, name, specialization)
        @person << teacher
    end

    puts 'Person created successfully.'
end

# Creating book method

def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @book << book
    puts 'Book created successfully.'
end

# Creating rental method

def create_rental
    puts 'select book by number'
    @books.each_with_index do |book, index|
        puts "#{index} - Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'select person by number'
    @person.each_with_index do |person, index|
    puts "#{index} - #{person.class}, Name: #{person.name}"
end

person_index = gets.chomp.to_i
puts 'Enter date:'
date = gets.chomp

rental = Rental.new(date, @books [book_index], @person[person_inmdex])
@rentals << rental
puts 'Rental created successfully.'
end

# Listing rentals method
def list_rentals_for_person
    puts 'all id'
    @rentals.each do |rental|
        puts " #{rental.person.id}, 
        Name: #{rental.person.name}"
    end
    puts 'select id'
    id = gets.chomp.to_i

    puts 'All Rentals for this id:'
    @rentals.each do |rental|
        if rental.person.id == id
            puts "Title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"

        else
            puts 'rental not found'
        end
    end
 end
end