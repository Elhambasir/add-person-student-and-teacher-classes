class Book
  attr_accessor :title, :author, :rental, :id

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
    @id = rand(1..1000)
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
