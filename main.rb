require './person.rb'
require './trimmerDecorator.rb'
require './capitalizeDecorator.rb'

person = Person.new('maximilianus',22)
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name