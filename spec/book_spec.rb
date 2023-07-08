require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  let(:book) { Book.new('test', 'elham') }
  let(:person) { Person.new('elham', 23, true) }
  let(:date) { '2023/09/09' }
  let(:rental) { Rental.new(date, book, person) }

  it 'Book must has a title' do
    expect(book.title).to eq('test')
  end

  it 'Book must has an author' do
    expect(book.author).to eq('elham')
  end

  it 'Book must has a rental' do
    expect(book.rental).to eq([])
  end

  it 'Book must has an id' do
    expect(book.id).to be_a(Integer)
  end

  it 'Add rentals must work prperly' do
    expect(book.add_rental(date, person)).to be_a(Rental)
  end
end
