require_relative 'app'

def display
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def run_app(app)
  menu_options = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals,
    '7' => :exit
  }
  loop do
    display
    input = gets.chomp

    if menu_options.key?(input)
      run = menu_options[input]
      app.send(run)
      break if run == 'exit'
    else
      puts 'Enter the correct option: '
    end
  end
end

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  run_app(app)
end

main
# require './person'
# require './trimmer_decorator'
# require './capitalize_decorator'
# require './book'
# require './rental'
# require './app'

# def display_options
#   puts 'What do you want to do?'
#   puts '1 - List all books'
#   puts '2 - List all people'
#   puts '3 - Create a person'
#   puts '4 - Create a book'
#   puts '5 - Create a rental'
#   puts '6 - List all rentals for a given person id'
#   puts '7 - Exit'
#   gets.chomp.to_i
# end

# def main
#   puts 'Welcome to School Library App!'

#     case display_options
#     when 1 then list_books
#     when 2 then list_people
#     when 3 then create_person
#     when 4 then create_book
#     when 5 then create_rental
#     when 6 then list_rentals
#     when 7 then break
#     else
#       puts 'Invalid option!'
#     end
#   end
# end

# main
