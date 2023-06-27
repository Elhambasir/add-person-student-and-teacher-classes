require_relative 'Person'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
