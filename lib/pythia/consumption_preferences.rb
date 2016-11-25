module Pythia
  class ConsumptionPreferences
    attr_reader :preferences

    def initialize(params)
      @params = params
      @preferences = []

      load_preferences
    end

    def list
      @preferences.map do |preference|
        preference.first
      end
    end

    private

    def load_preferences
      @params.each do |hash|
        @preferences << [hash]
      end
    end

    class Preference
      attr_reader :name

      def initialize(params)
        @params = params
      end

      def list
        @params
      end
    end
  end
end
