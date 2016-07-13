require 'oystercard'

describe Oystercard do
let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }
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

describe '#touch_in' do
  it 'records the entry station' do
  subject.top_up 10
  subject.touch_in(entry_station)
  expect(subject.stations[0]).to eq entry_station
  end

  it 'raises an error when card is below minimum balance' do
    expect { subject.touch_in(entry_station) }.to raise_error "No funds available please top up"
  end

end

describe '#touch_out' do
  it "charges the minumum fare on touch_out" do
    expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by -(Oystercard::MINIMUM_FARE)
  end

  it "records the exit station" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.stations[1]).to eq exit_station
  end

  it 'resets entry station on touch out' do
    subject.touch_out(exit_station)
    expect(subject.entry_station).to eq nil
  end
end

describe '#journey' do
  it 'adds stations to hash' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journey).to eq [entry_station, exit_station]
  end
end

end
