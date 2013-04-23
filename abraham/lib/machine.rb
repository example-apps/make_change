class Machine

  def initialize(change, coins)
    @change = change
    @coins = coins.sort {|lt, gt| gt <=> lt }
  end

  def generate_change
    mutable_change = @change
    change_given = []
    @coins.reduce(mutable_change) do |change, coin|
      next change if change - coin < 0
      product = change / coin
      product.times { change_given << coin }
      change -= product * coin
    end
    change_given
  end

  class << self
    def make_change(change, coins=[1, 5, 10, 25])
      if validate_denominations(coins)
        machine = Machine.new(change, coins)
        machine.generate_change
      end
    end

    def validate_denominations(coins)
      case
      when !coins.is_a?(Array)
        raise ArgumentError.new("You need an Array of coin denominations")
      when !coins.all? {|d| d.is_a?(Integer) }
        raise ArgumentError.new("All your coins need to be whole numbers")
      else
        return true
      end
    end

  end
end
