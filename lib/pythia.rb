require "olimpo"
require "pythia/version"
require "pythia/profile"
require "pythia/personality"
require "pythia/needs"
require "pythia/values"
require "pythia/behavior"
require "pythia/consumption_preferences"

module Pythia
  extend Olimpo
  autoload :Insight, "pythia/insight"
end
