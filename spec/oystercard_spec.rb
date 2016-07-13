require 'oystercard'

describe Oystercard do
 it 'balance should equal 0' do
     expect(subject.balance).to eq 0
 end

 describe '#top_up' do
   it 'can top up the balance' do
     expect{ subject.top_up 1}.to change{ subject.balance }.by 1
 end

 it 'raises an error when exceeds top up limit' do
   maximum_balance = Oystercard::MAXIMUM_BALANCE
   subject.top_up(maximum_balance)
   expect{ subject.top_up 1}.to raise_error "Maximum balance of #{maximum_balance} reached"
   end
 end

context 'is card in journey or not in journey'
  it 'is initially not in a journey' do
   expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
  subject.top_up 10
   subject.touch_in
   expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.top_up 10
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

describe '#touch_in' do
  it 'raises an error when card is below minimum balance' do
    expect { subject.touch_in }.to raise_error "No funds available please top up"
  end
end

describe '#touch_out' do
  it "charges the minumum fare on touch_out" do
    expect{ subject.touch_out }.to change{ subject.balance }.by -(Oystercard::MINIMUM_FARE)
  end
end

end
