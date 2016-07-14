require "journey"

describe Journey do

  let(:entry_station) {double(:station)}
  let(:exit_station) {double(:station)}

  describe '#entrance' do
    it "Stores entry_station in a hash" do
      journey = Journey.new
      journey.entrance(entry_station)
      expect(journey.current_journey).to include(:entry_station => entry_station)
    end
  end

  describe "#finish" do
    it "Store exit journey" do
      journey = Journey.new
      journey.finish(exit_station)
      expect(journey.current_journey).to include(:exit_station => exit_station)
    end
  end

  describe "#complete" do
    it 'determines whether current journey is complete' do
      subject.entrance(entry_station)
      subject.finish(exit_station)
      expect(subject.complete?).to eq true
    end
  end
end
