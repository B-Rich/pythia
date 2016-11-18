module Pythia
  class Insight < Olimpo::Base
    class << self
      def profile(params = {})
        response = post "/v3/profile", body: params, headers: { "Accept" => "application/json", "Content-Type" => "application/json"})

        return Insight::Profile.new(response.body) if response.success?

        raise_exception response.code, response.body
      end
    end
  end
end
