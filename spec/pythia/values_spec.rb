require 'spec_helper'

describe Pythia::Values do
  before(:each) do
    @values = Pythia::Values.new([{ "trait_id": "value_conservation",
                                    "name": "Conservation",
                                    "category": "values",
                                    "percentile": 0.89268222856139,
                                    "raw_score": 0.72135308187423 },
                                  { "trait_id": "value_openness_to_change",
                                    "name": "Openness to change",
                                    "category": "values",
                                    "percentile": 0.85759916388086,
                                    "raw_score": 0.82551308431323 }])
  end

  describe "#list" do
    it "should return an array with value names" do
      expect(@values.list).to eql(["Conservation", "Openness to change"])
    end
  end
end
