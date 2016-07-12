# This is the error: uninitialized constant Oystercard (NameError)
# This is the file path: /Users/acsauk/Projects/week_2/oystercard/spec/oystercard_spec.rb
# This is the line number of the error: 2
# The NameError has appeared because we have not told the spec file where to find the constant
# Create a constant/class called 'Oystercard' and link it in the spec file using require
require 'oystercard'

describe Oystercard do

 context 'when a new card is initialized' do

   it 'has a default monetary value of zero' do
     card = Oystercard.new
     expect( subject.balance ).to eq(0)
   end
 end

  context 'when a user want to top_up their oystercard balance' do

    it "prevents the user from adding money beyond the limit" do
      subject.instance_variable_set(:@balance, Oystercard::LIMIT)
      expect{subject.top_up(1)}.to raise_error("Maximum balance of £#{Oystercard::LIMIT} reached")
    end
    it 'add top_up balance to card' do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
    end

  end

end
