require 'spec_helper'

describe Pythia::ConsumptionPreferences do
  before(:each) do
    @consumption_preferences = Pythia::ConsumptionPreferences.new([{ "consumption_preference_category_id": "consumption_preferences_shopping",
                                                                      "name": "Purchasing Preferences",
                                                                      "consumption_preferences": [{ "consumption_preference_id": "consumption_preferences_automobile_ownership_cost",
                                                                                                    "name": "Prefers automobile ownership cost",
                                                                                                    "score": 0
                                                                                                  }]},
                                                                    { "consumption_preference_category_id": "consumption_preferences_health_and_activity",
                                                                      "name": "Health & Activity Preferences",
                                                                      "consumption_preferences": [{ "consumption_preference_id": "consumption_preferences_eat_out",
                                                                                                    "name": "Prefers to eat out",
                                                                                                    "score": 1
                                                                                                  }]}])
    @example_consumption_preferences = ExampleConsumptionPreferences.new
  end

  describe "#list" do
    it "should return a list of preferences" do
      expect(@consumption_preferences.list).to eql(@example_consumption_preferences.list)
    end
  end

  class ExampleConsumptionPreferences
    def list
      [{ :consumption_preference_category_id=>"consumption_preferences_shopping",
         :name=>"Purchasing Preferences", 
         :consumption_preferences=>[{:consumption_preference_id=>"consumption_preferences_automobile_ownership_cost",
                                     :name=>"Prefers automobile ownership cost",
                                     :score=>0}]},
       { :consumption_preference_category_id=>"consumption_preferences_health_and_activity",
         :name=>"Health & Activity Preferences",
         :consumption_preferences=>[{:consumption_preference_id=>"consumption_preferences_eat_out",
                                     :name=>"Prefers to eat out",
                                     :score=>1}]}]

    end
  end
end
