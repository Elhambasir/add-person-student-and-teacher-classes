require './person'
require './trimmer_decorator'
require './capitalize_decorator'
require './book'
require './rental'
require './student'
require './teacher'
require 'pry'
class App
  def initialize
    @people = []
    @books = []
  end

  def list_books
    @books.each { |book| puts "#{book.title} by #{book.author} on #{book.rentals.count} rentals" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, , Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? '
    person_type = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i
    if person_type == 1
      print 'Whats the parent permission? (y/n) '
      parent_permission = gets.chomp == 'y'
      @people << Student.new(name, age, parent_permission)
      puts 'Student created!'
    elsif person_type == 2
      print 'Specialization:'
      specialization = gets.chomp
      @people << Teacher.new(name, age, specialization)
      puts 'Teacher created!'
    else
      puts 'Person not created!'
    end
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created!'
  end

  def create_rental
    puts 'Choose a book from the list by number'
    @books.each_with_index { |book, index| puts "#{index} - #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Choose a person from the list by number:'
    @people.each_with_index { |person, index| puts "#{index} - #{person.name} - #{person.age} - #{person.class}" }
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Date in format yyyy/mm/dd:'
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'Rental created!'
  end

  def list_rentals
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}" }
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    person_info = @people.find { |person| person.id == person_id }
    person_info.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
  end

  def exit_app
    puts 'Exiting...'
    exit(0)
  end
end
