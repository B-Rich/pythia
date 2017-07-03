require 'spec_helper'

describe Pythia::Needs do
  before(:each) do
    @needs = Pythia::Needs.new([{ "trait_id": "need_challenge",
                                  "name": "Challenge",
                                  "category": "needs",
                                  "percentile": 0.67362332054511,
                                  "raw_score": 0.75196348037675 },
                                  { "trait_id": "need_closeness",
                                    "name": "Closeness",
                                    "category": "needs",
                                    "percentile": 0.83802834041813,
                                    "raw_score": 0.83714327329724 }])
  end

  describe "#list" do
    it "should return an array with trait names" do
      expect(@needs.list).to eql(["Challenge", "Closeness"])
    end
  end
end

