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

  describe '#deduct' do
    it 'reduces the balance by specified amount' do
      subject.top_up 15
      expect{ subject.deduct 5}.to change{ subject.balance }.by -5
    end
  end
end
