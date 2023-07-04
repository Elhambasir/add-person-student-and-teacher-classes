require './person'
require './trimmer_decorator'
require './capitalize_decorator'
require './book'
require './rental'
require './student'
require './teacher'
require './input_validator'
require './input_requester'
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
    input_requester = InputRequester.new
    input_validator = InputValidator.new
    person_type = input_validator.validate_person_type(input_requester.ask_for_person_type)
    name = input_validator.validate_person_name(input_requester.ask_for_person_name)
    age = input_validator.validate_person_age(input_requester.ask_for_person_age)
    if person_type == 1
      parent_permission = input_validator.validate_parent_permission(input_requester.ask_for_parent_permission)
      @people << Student.new(name, age, parent_permission)
      puts 'Student created!'
    elsif person_type == 2
      specialization = input_validator.validate_specialization(input_requester.ask_for_teacher_specialization)
      @people << Teacher.new(name, age, specialization)
      puts 'Teacher created!'
    else
      puts 'Person not created!'
    end
  end

  def create_book
    input_requester = InputRequester.new
    input_validator = InputValidator.new
    title = input_validator.validate_book_title(input_requester.ask_for_book_title)
    author = input_validator.validate_book_author(input_requester.ask_for_book_author)
    @books << Book.new(title, author)
    puts 'Book created!'
  end

  def create_rental
    input_requester = InputRequester.new
    input_validator = InputValidator.new
    @books.each_with_index { |book, index| puts "#{index} - #{book.title} by #{book.author}" }
    book_index = input_requester.ask_for_rental_book_index
    book = @books[book_index]
    @people.each_with_index { |person, index| puts "#{index} - #{person.name} - #{person.age} - #{person.class}" }
    person_index = input_requester.ask_for_rental_person_index
    person = @people[person_index]
    date = input_validator.validate_rental_date(input_requester.ask_for_rental_date)
    Rental.new(date, book, person)
    puts 'Rental created!'
  end

  def list_rentals
    input_requester = InputRequester.new
    InputValidator.new
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}" }
    person_id = input_requester.ask_for_rental_person_id
    puts 'Rentals: '
    person_info = @people.find { |person| person.id == person_id }
    person_info.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
  end

  def exit_app
    puts 'Exiting...'
    exit(0)
  end
end
