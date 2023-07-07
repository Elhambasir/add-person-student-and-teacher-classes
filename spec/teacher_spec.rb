require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('John', 24, 'Math')
  end

  it 'has a first name' do
    expect(@teacher.name).to eq('John')
  end

  it 'has an age ' do
    expect(@teacher.age).to eq(24)
  end

  it 'has a specialization' do
    expect(@teacher.specialization).to eq('Math')
  end

  it 'has an id' do
    expect(@teacher.id).to be_a(Integer)
  end

  it 'has a rental' do
    expect(@teacher.rental).to eq([])
  end

  it 'can use services' do
    expect(@teacher.can_use_services?).to eq(true)
  end
end
