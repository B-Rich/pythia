module Pythia
  class Profile
    attr_reader :word_count, :processed_language, :personality,
      :needs, :values, :behavior, :consumption_preferences,
      :warnings

    def initialize(params)
      @word_count = params["word_count"]
      @processed_language = params["processed_language"]
      @personality = Pythia::Personality.new params["personality"]
      @needs = Pythia::Needs.new params["needs"]
      @values = Pythia::Values.new params["values"]
      @behavior = Pythia::Behavior.new params["behavior"]
      @consumption_preferences = Pythia::ConsumptionPreferences.new params["consumption_preferences"]
      @warnings = Pythia::Warnings.new params["warnings"]
    end
  end
end
