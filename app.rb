require_relative 'storage'
require_relative 'person'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'input_validator'
require_relative 'input_requester'
require 'pry'

class App
  def initialize(storage_handler)
    @people = []
    @books = []
    @storage_handler = storage_handler
  end

  def list_books
    @books = @storage_handler.load_data('books.json')
    @books.each { |book| puts "#{book[:title]} by #{book[:author]}" }
  end

  def list_people
    @people = @storage_handler.load_data('people.json') || []
    @people.each do |person|
      person_type = person[:person_type] == 1 ? 'Student' : 'Teacher'
      puts "[#{person_type}] Name: #{person[:name]}, Age: #{person[:age]}"
    end
  end

  def create_person
    input_requester = InputRequester.new
    input_validator = InputValidator.new

    person_type = input_validator.validate_person_type(input_requester.ask_for_person_type)
    name = input_validator.validate_person_name(input_requester.ask_for_person_name)
    age = input_validator.validate_person_age(input_requester.ask_for_person_age)

    new_person = create_person_based_on_type(person_type, name, age, input_requester, input_validator)
    @people = @storage_handler.load_data('people.json') || []
    @people.push(new_person)
    @storage_handler.save_data('people.json', @people)
    puts 'Person created!'
  end

  def create_person_based_on_type(person_type, name, age, input_requester, input_validator)
    if person_type == 1
      parent_permission = input_validator.validate_parent_permission(input_requester.ask_for_parent_permission)
      Student.new(name, age, parent_permission).to_hash
    elsif person_type == 2
      specialization = input_validator.validate_specialization(input_requester.ask_for_teacher_specialization)
      Teacher.new(name, age, specialization).to_hash
    end
  end

  def create_book
    input_requester = InputRequester.new
    input_validator = InputValidator.new

    title = input_validator.validate_book_title(input_requester.ask_for_book_title)
    author = input_validator.validate_book_author(input_requester.ask_for_book_author)

    book = Book.new(title, author)
    new_book = { title: title, author: author, id: book.id }

    @books = @storage_handler.load_data('books.json') || []
    @books.push(new_book)
    @storage_handler.save_data('books.json', @books)
    puts 'Book created!'
  end

  def create_rental
    input_requester = InputRequester.new
    input_validator = InputValidator.new

    books = @storage_handler.load_data('books.json') || []
    people = @storage_handler.load_data('people.json') || []

    puts 'Select a book from the list'
    books.each_with_index { |book, index| puts "#{index} - #{book[:title]} by #{book[:author]}" }
    book_index = input_requester.ask_for_rental_book_index
    book = books[book_index]

    puts 'Select a person from the list'
    people.each_with_index do |person, index|
      person_type = person[:person_type] == 1 ? 'Student' : 'Teacher'
      puts "#{index} - #{person[:name]} - #{person[:age]} - #{person_type}"
    end
    person_index = input_requester.ask_for_rental_person_index
    person = people[person_index]

    date = input_validator.validate_rental_date(input_requester.ask_for_rental_date)

    rental = create_rental_object(date, book, person)
    rentals = @storage_handler.load_data('rental.json') || []
    rentals.push(rental)
    @storage_handler.save_data('rental.json', rentals)
    puts 'Rental created!'
  end

  def create_rental_object(date, book, person)
    {
      date: date,
      book_id: book[:id],
      person_id: person[:id]
    }
  end

  def list_rentals
    input_requester = InputRequester.new

    people = @storage_handler.load_data('people.json') || []
    books = @storage_handler.load_data('books.json') || []
    rentals = @storage_handler.load_data('rental.json') || []

    person_id = input_requester.ask_for_rental_person_id
    person_rentals = rentals.select { |rental| rental[:person_id] == person_id }

    person_rentals.each do |rental|
      book = books.find { |item| item[:id] == rental[:book_id] }
      person = people.find { |person| person[:id] == person_id }
      puts "#{rental[:date]} - #{book[:title]} - #{person[:name]}" unless book.nil? || person.nil?
    end
  end

  def exit_app
    puts 'Exiting...'
    exit(0)
  end
end
