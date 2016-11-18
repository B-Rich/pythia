module Pythia
  class Insight < Olimpo::Base
    class << self
      def profile(params = {})
        response = post("/v3/profile",
                        body: params,
                        headers: {
                          "Accept" => "application/json",
                          "Content-Type" => "application/json"
                        })

        raise_exception response.code, response.body unless response.success?

        Insight::Profile.new(response.body)
      end
    end
  end
end
