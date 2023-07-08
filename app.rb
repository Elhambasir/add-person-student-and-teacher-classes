require './person'
require './trimmer_decorator'
require './capitalize_decorator'
require './book'
require './rental'
require './student'
require './teacher'
require './input_validator'
require './input_requester'

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
    @people = @storage_handler.load_data('people.json')
    return if @people.nil?

    @people.each do |person|
      puts "[#{person[:person_type] == 1 ? 'Student' : 'Teacher'}] Name: #{person[:name]}, Age: #{person[:age]}"
    end
  end

  def create_person
    input_requester = InputRequester.new
    input_validator = InputValidator.new

    person_type = input_validator.validate_person_type(input_requester.ask_for_person_type)
    name = input_validator.validate_person_name(input_requester.ask_for_person_name)
    age = input_validator.validate_person_age(input_requester.ask_for_person_age)

    new_person = create_person_based_on_type(person_type, name, age, input_requester, input_validator)
    res = @storage_handler.load_data('people.json')
    @people = check_if_res_is_array(res, @people)
    @people.push(new_person)
    @storage_handler.save_data('people.json', @people)
    puts 'Person created!'
  end

  def check_if_res_is_array(res, people)
    if !res.nil? && res.class != Array
      people.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      people = res
    end
    people
  end

  def create_student(person, person_type)
    {
      person_type: person_type,
      name: person.name,
      age: person.age,
      parent_permission: person.parent_permission,
      id: person.id
    }
  end

  def create_teacher(person, person_type)
    {
      person_type: person_type,
      name: person.name,
      age: person.age,
      specialization: person.specialization,
      id: person.id
    }
  end

  def create_person_based_on_type(person_type, name, age, input_requester, input_validator)
    if person_type == 1
      person = Student.new(name, age,
                           input_validator.validate_parent_permission(input_requester.ask_for_parent_permission))
      create_student(person, person_type)
    elsif person_type == 2
      person = Teacher.new(name, age,
                           input_validator.validate_specialization(input_requester.ask_for_teacher_specialization))
      create_teacher(person, person_type)
    end
  end

  def create_book
    input_requester = InputRequester.new
    input_validator = InputValidator.new
    title = input_validator.validate_book_title(input_requester.ask_for_book_title)
    author = input_validator.validate_book_author(input_requester.ask_for_book_author)
    book = Book.new(title, author)
    newbook = { title: title, author: author, id: book.id }
    res = @storage_handler.load_data('books.json')
    if !res.nil? && res.class != Array
      @books.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @books = res
    end

    @books.push(newbook)
    @storage_handler.save_data('books.json', @books)
    puts 'Book created!'
  end

  def create_rental
    input_requester = InputRequester.new
    input_validator = InputValidator.new

    books = @storage_handler.load_data('books.json')
    people = @storage_handler.load_data('people.json')

    puts 'Select a book from the list'
    books.each_with_index { |book, index| puts "#{index} - #{book[:title]} by #{book[:author]}" }
    book_index = input_requester.ask_for_rental_book_index
    book = books[book_index]

    puts 'Select a person from the list'
    people.each_with_index do |person, index|
      puts "#{index} - #{person[:name]} - #{person[:age]} - #{person[:person_type] == 1 ? 'Student' : 'Teacher'}"
    end
    person_index = input_requester.ask_for_rental_person_index
    person = people[person_index]

    date = input_validator.validate_rental_date(input_requester.ask_for_rental_date)

    rental = create_rental_object(date, book, person)
    res = @storage_handler.load_data('rental.json')
    res = check_if_res_is_empty(res, rental)
    @storage_handler.save_data('rental.json', res)
    puts 'Rental created!'
  end

  def check_if_res_is_empty(res, rentals)
    rental = []
    if !res.nil? && res.class != Array
      rental.push(res)
      rental.push(rentals)
    elsif !res.nil? && res.instance_of?(Array)
      rental = res
      rental.push(rentals)
    end
    rental
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
    storage_handler = @storage_handler

    people = storage_handler.load_data('people.json')
    books = storage_handler.load_data('books.json')
    rentals = storage_handler.load_data('rental.json')

    pid = input_requester.ask_for_rental_person_id
    rentals = rentals.select { |rental| rental[:person_id] == pid }

    rentals.each do |rental|
      book = books.find { |item| item[:id] == rental[:book_id] }
      persons = people.find { |person| person[:id] == pid }
      puts "#{rental[:date]} - #{book[:title]} - #{persons[:name]}" unless book.nil? || persons.nil?
    end
  end

  def exit_app
    puts 'Exiting...'
    exit(0)
  end
end
