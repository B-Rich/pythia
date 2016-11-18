module Pythia
  class Needs
    def initialize(params)
    end

    private

    class Trait
      attr_reader :percentile, :raw_score

      def initialize(params)
        @percentile = params[:percentile]
        @raw_score = params[:raw_score]
      end
    end

    class Facets
      def initialize(params)
        @params = params
      end

      def to_a
        return [] unless @params

        @params.map do |facet|
          [facet.to_sym, facet[:percentile], facet[:raw_score]]
        end
      end
    end
  end
end
