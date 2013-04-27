class Change
  def initialize(target, coins = [25,10,5,1])
    @target = target
    @coins = coins.sort.reverse
  end

  def make_change
    @coins.map { |coin| deduct(@target, coin) }.flatten
  end

private
  def deduct(amount, coin)
    qty = amount / coin
    @target -=  qty * coin
    qty.times.map { coin }
  end
end