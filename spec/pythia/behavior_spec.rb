require 'pythia'

describe Pythia::Behavior do
  before(:each) do
    @behavior = Pythia::Behavior.new([{"trait_id": "behavior_sunday",
                                       "name": "Sunday",
                                       "category": "behavior",
                                       "percentage": 0.21392532795156 },
                                      {"trait_id": "behavior_monday",
                                       "name": "Monday",
                                       "category": "behavior",
                                       "percentage": 0.42583249243189 },
                                      {"trait_id": "behavior_0000",
                                       "name": "0:00 am",
                                       "category": "behavior",
                                       "percentage": 0.4561049445005 }])
  end
  describe "#list" do
    it "should return an array of trait names" do
      expect(@behavior.list).to eql ["Sunday", "Monday", "0:00 am"]
    end
  end
end

