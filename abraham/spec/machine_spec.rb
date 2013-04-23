require 'spec_helper'

describe Machine do
  let(:coins) { [1, 5, 10, 25] }
  let(:change) { 10 }
  let(:machine) { Machine.new(change, coins) }

  it 'is defined' do
  end

  context 'self' do
    describe '#make_change' do
      it 'is a method on Machine' do
        expect(Machine).to respond_to(:make_change)
      end

      it 'raise error for denomination 1' do
        expect { Machine.make_change(change, 1) }.to raise_error(ArgumentError, 'You need an Array of coin denominations')
      end

      it 'raise error for denomination [1, 5, 10.5]' do
        expect { Machine.make_change(change, [1, 5, 10.5]) }.to raise_error(ArgumentError, 'All your coins need to be whole numbers')
      end
    end

    describe '#validate_denominations' do
      it 'is a method' do
        expect(Machine).to respond_to(:validate_denominations)
      end

      it 'returns true if denominations is [1, 5, 10, 25]' do
        expect(Machine.validate_denominations(coins)).to be true
      end

      it 'raises "You need an Array of coin denominations" for 1' do
        expect { Machine.validate_denominations(1) }.to raise_error(ArgumentError, 'You need an Array of coin denominations')
      end

      it 'raises "All your coins need to be whole numbers" for [1, 5, 10.5]' do
        expect { Machine.validate_denominations([1, 5, 10.5]) }.to raise_error(ArgumentError, 'All your coins need to be whole numbers')
      end
    end
  end

  context 'instance of Machine' do
    describe '#generate_change' do
      it 'is a method' do
        expect(machine).to respond_to(:generate_change)
      end

      it 'returns [10] for change 10 and coins [1, 5, 10, 25]' do
        expect(machine.generate_change).to eql([10])
      end

      it 'returns [25, 25] for change 50 and coins [1, 5, 10, 25]' do
        change = 50
        machine = Machine.new(change, coins)
        expect(machine.generate_change).to eql([25, 25])
      end

      it 'returns [25, 5] for change 30 and coins [1, 5, 10, 25]' do
        change = 30
        machine = Machine.new(change, coins)
        expect(machine.generate_change).to eql([25, 5])
      end

      it 'returns [7, 3, 3] for change 13 and coins [2, 3, 7, 14]' do
        change = 13
        coins = [2, 3, 7, 14]
        machine = Machine.new(change, coins)
        expect(machine.generate_change).to eql([7, 3, 3])
      end

      it 'returns [14] for change 14 and coins [2, 3, 7, 14]' do
        change = 14
        coins = [2, 3, 7, 14]
        machine = Machine.new(change, coins)
        expect(machine.generate_change).to eql([14])
      end

    end
  end
end
