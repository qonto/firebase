require 'spec_helper'

describe FirebaseMessenger::Helpers::ResponseHelper do
  describe '#build_response' do
    it 'instantiate FirebaseMessenger::Api::Response' do
      expect(FirebaseMessenger::Api::Response).to receive(:new)
        .with({})

      build_response('{}')
    end
  end
end
