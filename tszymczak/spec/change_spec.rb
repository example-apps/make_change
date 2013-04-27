require 'spec_helper'

describe Change do

  let(:change) { Change.new(40) }

  it 'Should respond with an array' do
    expect(change.make_change).to be_an_instance_of Array
  end

  it 'Should return [25,10,5]' do
    expect(change.make_change).to eq([25,10,5])
  end

end
