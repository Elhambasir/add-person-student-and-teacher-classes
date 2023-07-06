require_relative 'Person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission)
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
