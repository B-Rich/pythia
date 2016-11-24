module Pythia
  class Insight < Olimpo::Base
    class << self
      def profile(params = {})
        response = post("/v3/profile?version=2016-10-20&consumption_preferences=true&raw_scores=true",
                        body: params,
                        headers: {
                          "Accept" => "application/json",
                          "Content-Type" => "application/json"
                        })

        raise_exception response.code, response.body unless response.success?

        Pythia::Profile.new(response.body)
      end
    end
  end
end
