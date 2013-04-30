class	ChangeMaker

	def self.change_out(amount, denominations = [25,10,5,1])
		return "Amount should be a whole number" unless amount.is_a?(Integer)
		return "Denominations should be an Array" unless denominations.is_a?(Array)
		amount_given = amount
		change_returned = []
		# filter through denominations
		denominations.each do |d|
			# if first denomination is greater than amount, then move onto the next change
			if amount_given >= d
				amt = (amount_given/d).to_i
				1.upto(amt) do
					change_returned << d
					amount_given = (amount_given - d)
				end
			end
		end
		change_returned
	end

end