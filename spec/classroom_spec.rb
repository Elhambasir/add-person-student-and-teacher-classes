require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('CSD21')
  end

  it 'checking classroom instance' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'checking attributes' do
    expect(@classroom.label).to eq('CSD21')
  end

  it 'test for add student' do
    student = double('student')
    allow(student).to receive(:age) { '24' }
    allow(student).to receive(:name) { 'elham' }
    allow(student).to receive(:parent_permission) { true }
    allow(student).to receive(:classroom=).and_return(Classroom)
    expect(@classroom.add_student(student).students[0].name).to eq('elham')
  end
end
