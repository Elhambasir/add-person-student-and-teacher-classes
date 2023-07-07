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
