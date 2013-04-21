module ChangeMaker
  extend self

  def make_change(amount, denominations = [25, 10, 5, 1])
    change_traversals = []
    while denominations.any?
      change_traversals << change_for_denomination(amount, denominations)
      denominations.shift
    end
    change_traversals.sort_by!{|c| c.size}.first
  end

  def change_for_denomination(amount, denominations)
    coins = []
    denominations.each do |d|
      while amount >= d
        coins << d
        amount -= d
      end
    end
    coins
  end

end