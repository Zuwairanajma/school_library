class App
    attr_reader :books, :person, :rentals, :classroom

    def initialize
        @books = []
        @person = []
        @rentals = []
    end

    def list_all_books()
        puts 'All Books:'
        @books.each do |book| 
            puts "Title: #{book.title},Author: #{book.author}"
        end
    end

    def list_all_people()
        puts 'All People:'
        @person.each do 