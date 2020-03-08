require "./lib/UrbanDictionary/version"
require_relative "UrbanDictionary/cli"
require_relative "UrbanDictionary/api"
require_relative "UrbanDictionary/term"
require_relative "UrbanDictionary/definition"

require 'pry'
require 'httparty'


module UrbanDictionary
  class Error < StandardError; end
  # Your code goes here...
end
