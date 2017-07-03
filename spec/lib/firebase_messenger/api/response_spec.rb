require 'spec_helper'

describe FirebaseMessenger::Api::Response do
  describe '.build' do
    it 'instantiate an OpenStruct' do
      expect(OpenStruct).to receive(:new)

      described_class.build({})
    end
  end
end
