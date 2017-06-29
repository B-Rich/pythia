module Pythia
  class Behavior
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
      attr_reader :name, :percentage

      def initialize(params)
        @name = params[:name]
        @percentile = params[:percentage]
      end

      def to_a
        [@name.to_sym, @percentage]
      end
    end
  end
end
