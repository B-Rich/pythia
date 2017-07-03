require 'spec_helper'

describe Pythia::Warnings do
  before(:each) do
    @warnings = Pythia::Warnings.new([{ "warning_id": "WORD_COUNT_MESSAGE",
                                        "message": "There were number words in the input.
                                         We need a minimum of 600, preferably 1,200 or more,
                                         to compute statistically significant estimates."},
                                      { "warning_id": "JSON_AS_TEXT",
                                        "message": "Request input was processed as text/plain
                                         as indicated, however detected a JSON input. Did you
                                        mean application/json?"}])
    @warnings_list_example = ["WORD_COUNT_MESSAGE", "JSON_AS_TEXT"]
  end

  describe "#list" do
    it "should return an array with complete warnings as text" do
      expect(@warnings.list).to  eql(@warnings_list_example)
    end
  end
end
