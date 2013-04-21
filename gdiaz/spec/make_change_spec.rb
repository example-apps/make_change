require 'spec_helper'

module ChangeMaker
  describe 'MakeChange' do

    it 'should make a change array optimal for 25cents' do
      ChangeMaker.make_change(25).should eq([25])
    end

    it 'should make a change array optimal 38cents' do
      ChangeMaker.make_change(38).should eq([25, 10, 1, 1, 1])
    end

    it 'should output 7,7 for new denomination' do
      ChangeMaker.make_change(14, [10, 7, 1]).should eq([7, 7])
    end

  end
end