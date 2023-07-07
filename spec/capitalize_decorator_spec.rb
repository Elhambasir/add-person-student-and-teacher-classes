require_relative '../decorator'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'elham') }
  subject(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }

  it 'should inherit from Decorator' do
    expect(capitalize_decorator).to be_a(Decorator)
  end

  it 'should delegate correct_name to nameable' do
    expect(capitalize_decorator.correct_name).to eq('Elham')
  end
end
