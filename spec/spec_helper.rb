require 'simplecov'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

SimpleCov.start

require 'firebase_messenger'

require 'lib/support/fake_firebase'

RSpec.configure do |config|
  config.include FirebaseMessenger::Helpers::ConnectHelper
  config.include FirebaseMessenger::Helpers::ErrorsHelper
  config.include FirebaseMessenger::Helpers::ResponseHelper

  config.before(:each) do
    WebMock.stub_request(:any, /#{FirebaseMessenger.api_base}/).to_rack(FakeFirebase)
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
