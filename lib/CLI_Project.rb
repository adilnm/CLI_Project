# require 'bundler'
# Bundler.require
require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative "./CLI_Project/version"
require_relative "./CLI_Project/scraper"
require_relative "./CLI_Project/aviary"
require_relative "./CLI_Project/cli"

module CLIProject
  class Error < StandardError; end
  # Your code goes here...
end
