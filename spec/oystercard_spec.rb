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
  context 'when a user touches in and out of their journey' do
      before(:each) do
        subject.top_up(1)
      end
    it "checks whether it is on a journey" do
      expect(subject).not_to be_in_journey
    end
    it 'knows when it\'s on a journey when the user touchs in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'raises an error if balance is below minimum value' do
      subject.touch_out
      expect{subject.touch_in}.to raise_error("Sorry, balance below minimum threshold")
    end
    it 'knows that it\'s not on a journey when the user touches out' do
      subject.touch_in
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
    it 'deducts the fare from the card' do
      subject.touch_in
      expect{subject.touch_out}.to change{subject.balance}.by (-Oystercard::MINIMUM_CHARGE)
    end
  end
end
