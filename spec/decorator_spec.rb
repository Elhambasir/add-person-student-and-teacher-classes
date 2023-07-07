require_relative '../decorator'

describe Decorator do
  let(:nameable) { double('Nameable', correct_name: 'elham') }
  subject(:decorator) { Decorator.new(nameable) }

  it 'should inherit from Nameable' do
    expect(decorator).to be_a(Nameable)
  end

  it 'should delegate correct_name to nameable' do
    expect(decorator.correct_name).to eq('elham')
  end
end
