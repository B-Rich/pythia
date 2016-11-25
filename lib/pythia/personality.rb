module Pythia
  class Personality
    attr_reader :openness, :conscientiousness,
    :extraversion, :agreeableness,
    :neuroticism

    def initialize(params)
      params.each do |big_five|
        traits.each do |trait|
          instance_variable_set "@#{trait}", Trait.new(big_five)
        end
      end
    end

    private

    def traits
      [:openness,
       :conscientiousness,
       :extraversion,
       :agreeableness,
       :neuroticism]
    end

    class Trait
      attr_reader :percentile, :raw_score, :facets

      def initialize(params)
        @percentile = params[:percentile]
        @raw_score = params[:raw_score]
        @facets = Facets.new(params[:children])
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
