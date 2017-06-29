module Pythia
  class Needs
    attr_reader :traits

    def initialize(params)
      @params = params
      @traits = []

      load_traits
    end

    def list
      @traits.map &:name
    end

    private

    def load_traits
      @params.each do |hash|
        @traits << Trait.new(hash)
      end
    end

    class Trait
      attr_reader :name, :percentile, :raw_score

      def initialize(params)
        @name = params[:name]
        @percentile = params[:percentile]
        @raw_score = params[:raw_score]
      end

      def to_a
        [@name.to_sym, @percentile, @raw_score]
      end
    end
  end
end
