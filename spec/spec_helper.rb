require 'simplecov'
SimpleCov.minimum_coverage(95)
SimpleCov.start

require "figaro"

Figaro.application = Figaro::Application.new(environment: "testing", path: "config/application.yml")
Figaro.load

require "twitter"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
