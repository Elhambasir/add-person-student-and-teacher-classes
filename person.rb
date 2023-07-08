require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rental, :parent_permission
  attr_reader :id

  def initialize(name, age, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = 'Unknown' if @name == ''
  end
end
