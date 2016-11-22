require "pythia/version"
require "olimpo"

module Pythia
  extend Olimpo
  autoload :Insight, "pythia/insight"

  configure do
    username = ENV['WATSON_USERNAME']
    password = ENV['WATSON_PASSWORD']
    base_uri = ENV['WATSON_URI']
  end
end
