require_relative 'app'
require_relative 'menu'

def run_app(app)
  menu_options = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals,
    '7' => :exit_app
  }
  menu = Menu.new
  loop do
    menu.display_menu
    input = menu.user_input
    if menu_options.key?(input)
      app.send(menu_options[input])
      break if menu_options[input] == :exit_app.to_s
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

def handle_menu_input(app, input)
  run = menu_options[input]
  app.send(run)
end

def main
  app = App.new

  puts 'Welcome to the School Library App!'

  run_app(app)
end

main
