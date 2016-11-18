module Pythia
  class Profile
    attr_reader :word_count, :processed_language, :personality
    :needs, :values, :behavior, :consumption_preferences
    :warnings

    def initialize(params)
      @word_count = params[:word_count]
      @processed_language = params[:processed_language]
      @personality = Insight::Personality.new params[:personality]
      @needs = Insight::Needs.new params[:needs]
      @values = Insight::Values.new params[:values]
      @behavior = Insight::Behavior.new params[:behavior]
      @consumption_preferences = Insight::ConsumptionPreferences.new params[:consumption_preferences]
      @warnings = Insight::Warnings.new params[:warnings]
    end
  end
end
