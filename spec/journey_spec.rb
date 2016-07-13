require 'journey'

describe Journey do
  it 'Checks that no stations are currently stored' do
    expect(subject.journeys).to be_empty
  end

let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
    it 'adds stations to hash' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
end
