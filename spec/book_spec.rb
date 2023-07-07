require_relative '../book'

describe Book do
  let(:book) { Book.new('test', 'elham') }

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
end
