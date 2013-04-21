require 'spec_helper'
require_relative '../change_maker'

module ChangeMaker
  describe Machine do
    describe 'make_change' do
      context 'with only an amount' do
        it 'should provide [25,10,1,1,1,1] for 39' do
          Machine::make_change(39).should == [25,10,1,1,1,1]
        end
        it 'should provide [25,25,5,1,1] for 57' do
          Machine::make_change(57).should == [25,25,5,1,1]
        end
        it 'should raise error for 0' do
          expect { Machine::make_change(0)}.to raise_error
        end
        it 'should provide [1] for 1' do
          Machine::make_change(1).should == [1]
        end
      end
      context 'with an amount and denominations' do
        it 'should provide [7,7] for 14' do
          Machine::make_change(14, [10, 7, 1]).should == [7,7]
        end
        it 'should provide [21, 21, 21, 21, 21, 21, 21, 21, 3, 1] for 172' do
          Machine::make_change(172, [18, 21, 3, 1]).should == [21,21,21,21,21,21,21,21, 3, 1]
        end
        it 'should raise an error when denominations array blank' do
          expect { Machine::make_change(2, [])}.to raise_error
        end
      end
      context 'with a float as the amount' do
        it 'should raise an error' do
          expect { Machine::make_change(1.7)}.to raise_error
        end
      end
      context 'with an integer as the amount' do
        it 'should not raise an error' do
          expect { Machine::make_change(1)}.to_not raise_error
        end
      end
      context 'without a 1 in demoninations' do
        it 'should raise an error' do
          expect { Machine::make_change(21, [43,2,4])}.to raise_error
        end
      end
      context 'with a 1 in demoninations' do
        it 'should not raise an error' do
          expect { Machine::make_change(21, [43,2,4, 1])}.to_not raise_error
        end
      end
    end
  end
end
