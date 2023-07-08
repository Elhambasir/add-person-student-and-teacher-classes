require_relative '../student'
require_relative '../classroom'
require_relative '../person'

describe Student do
  before :each do
    @student = Student.new('John', 24, 'true')
  end
  it 'has a first name' do
    expect(@student.name).to eq('John')
  end

  it 'has an age ' do
    expect(@student.age).to eq(24)
  end

  it 'has an id' do
    expect(@student.id).to be_a(Integer)
  end

  it 'has a rental' do
    expect(@student.rental).to eq([])
  end

  it 'should set the classroom of the student' do
    student123 = Student.new('John', 24, parent_permission: true)
    classroom = Classroom.new('A')
    student123.classroom = classroom
    expect(student123.classroom).to eq(classroom)
  end

  it 'can not use services (under age no parent permission)' do
    expect(@student.can_use_services?).to eq(true)
  end

  it 'play_hooky must return  \'¯\(ツ)/¯\' ' do
    expect(@student.play_hooky).to eq('¯\(ツ)/¯')
  end
end
