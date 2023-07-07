# Write test for class TrimmerDecorator you can see the code of the class bellow:
# require './decorator'
# class TrimmerDecorator < Decorator
#   def correct_name
#     name = @nameable.correct_name
#     name.length > 10 ? name[0..9] : name
#   end
# end

require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'elham') }
  subject(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

  it 'should inherit from Decorator' do
    expect(trimmer_decorator).to be_a(Decorator)
  end

  it 'should delegate correct_name to nameable' do
    expect(trimmer_decorator.correct_name).to eq('elham')
  end
end
