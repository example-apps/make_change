require 'pry'
module ChangeMaker
  class Machine
    def self.make_change(change_for, denominations = [1,5,10,25])
      # Handle error scenarios
      raise 'Must use an integer to get change' unless change_for.class == Fixnum
      raise 'Denominations must include a 1' unless denominations.include?(1)
      raise 'Must supply at least 1 integer when supplying denominations' if denominations.length == 0
      raise 'Can\'t provide change for nothing...' if change_for == 0

      # Organize denominations highest to lowest
      denominations.sort!.reverse!

      # Initialize Class Instance variable to store different combinations of change
      @permutations = []

      # Populate permutations with combinations of change
      calculate_permutations(change_for, denominations)

      # Find the best set of change for the user
      most_efficient_change
    end

    # Recursive method to generate permutations of
    # change combinations
    def self.calculate_permutations(change_for, denominations)
      change = []
      local_change_for = change_for
      denominations.each do |d|
        while local_change_for - d >= 0
          change << d
          local_change_for -= d
        end
      end
      denominations.shift
      calculate_permutations(change_for, denominations) if denominations.length >= 1
      @permutations << change
    end

    # Select the change with the least amount of coins
    def self.most_efficient_change
      @permutations.sort_by!{ |a| [a.length, -a.max] }
      @permutations.first
    end
  end
end
