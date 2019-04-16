#require "CLI_Project/version"
require 'bundler'
Bundler.require
require_relative "./CLI_Project/version"
require_relative "./CLI_Project/scraper"
require_relative "./CLI_Project/aviary"
require_relative "./CLI_Project/cli"

module CLIProject
  class Error < StandardError; end
  # Your code goes here...
end
