require "simplecov"
require "coveralls"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start { add_filter "/spec/" }

require "pry"
require "showfix"
require "showfix/cli"

RSpec.configure do |config|
  config.mock_with :rspec do |mocks_config|
    mocks_config.verify_doubled_constant_names = true
    # Enable config option this when a new rspec-mocks beta including this patch is released:
    # https://github.com/rspec/rspec-mocks/pull/466
    #
    # mocks_config.verify_partial_doubles = true
  end
end