# Write a test for class @person and their methods

require_relative '../person'

describe Person do
  before :each do
    @person = Person.new('John', 24, true); # this is a shortcut for creating a new @person object
    @person_can_use_services = Person.new('Ali', 12, true)
    @person_can_not_use_services = Person.new('Karim', 12, false)
    @person_validate_name_if_given_empty_string = Person.new('', 18, true)
  end
  it 'has a first name' do
    expect(@person.name).to eq('John')
  end

  it 'has an age ' do
    expect(@person.age).to eq(24)
  end

  it 'has a parent permission but under age' do
    expect(@person_can_use_services.can_use_services?).to eq(true)
  end

  it 'has an id' do
    expect(@person.id).to be_a(Integer)
  end

  it 'has a rental' do
    expect(@person.rental).to eq([])
  end

  it 'can not use services (under age no parent permission)' do
    expect(@person_can_not_use_services.can_use_services?).to eq(false)
  end

  it 'check if name is correct' do
    expect { @person_validate_name_if_given_empty_string.correct_name }.to raise_error(NotImplementedError)
  end
end
