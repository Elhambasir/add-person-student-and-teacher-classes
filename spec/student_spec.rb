require_relative '../student'

describe Student do
  before :each do
    @student = Student.new('John', 24, 'A')
  end
  it 'has a first name' do
    expect(@student.name).to eq('John')
  end

  it 'has an age ' do
    expect(@student.age).to eq(24)
  end

  it 'has a parent permission but under age' do
    expect(@student.parent_permission).to eq(true)
  end

  it 'has an id' do
    expect(@student.id).to be_a(Integer)
  end

  it 'has a rental' do
    expect(@student.rental).to eq([])
  end

  it 'has a classroom' do
    expect(@student.classroom).to eq('A')
  end

  it 'can not use services (under age no parent permission)' do
    expect(@student.can_use_services?).to eq(true)
  end
end
