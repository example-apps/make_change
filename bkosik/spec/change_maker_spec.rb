require_relative "../lib/change_maker"

describe ChangeMaker do

	it "should accept only whole numbers" do
		@change_returned = ChangeMaker.change_out(40.5)
		@change_returned.should == "Amount should be a whole number"
	end

	it "should throw an error if any alpha characters are in the amount" do
		@bad_amount = ChangeMaker.change_out("12a")
		@bad_amount.should == "Amount should be a whole number"
	end

	it "should take a whole amount and return the change" do
		@amount_due_back = ChangeMaker.change_out(40)
		@amount_due_back.should == [25,10,5]
	end

	it "should give change back of [10,10,1,1]" do
		@amount_due_back = ChangeMaker.change_out(22)
		@amount_due_back.should == [10,10,1,1]
	end

	it "should throw an error if custom denominations is not an array" do
		@bad_denomination = ChangeMaker.change_out(292, 21)
		@bad_denomination.should == "Denominations should be an Array"
	end

	it "should return the change for an amount with a good custom denomination" do
		@change_returned = ChangeMaker.change_out(50, [17,8,2,1])
		@change_returned.should == [17,17,8,8]
	end



end