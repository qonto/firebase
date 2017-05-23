require 'simplecov'
SimpleCov.start

require 'firebase_messenger'

RSpec.configure do |config|
  config.include FirebaseMessenger::Helpers::ConnectHelper
  config.include FirebaseMessenger::Helpers::ErrorsHelper

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
