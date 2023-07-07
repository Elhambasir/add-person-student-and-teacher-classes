require_relative '../classroom'
require_relative '../student'
require_relative '../person'
describe Classroom do
  let(:classroom) { Classroom.new('CS101') }
  let(:student1) { Student.new('Elham', 23, classroom) }
  let(:student2) { Student.new('John', 24, classroom) }

  it 'should have a label' do
    expect(classroom.label).to eq('CS101')
  end

  it 'should have an empty list of students' do
    expect(classroom.students).to be_empty
  end
end
