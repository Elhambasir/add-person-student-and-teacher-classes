# Write test for class Nameable

require_relative '../nameable'

describe Nameable do
  subject(:nameable) { Nameable.new }

  it 'should raise NotImplementedError' do
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
