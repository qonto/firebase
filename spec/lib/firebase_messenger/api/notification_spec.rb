require 'spec_helper'

describe FirebaseMessenger::Api::Notification do
  describe 'send' do
    context 'when response has 0 failure' do
      subject { described_class.new(['1'], {}) }

      it 'returns response json' do
        expect(subject.send).to be_a(Hash)
      end
    end

    context 'when response has 1 failure' do
      subject { described_class.new(['1'], { failure: true }) }
      it 'raise error' do
        expect { subject.send }.to  raise_error(FirebaseMessenger::BaseError, '[{:error=>"InvalidApnsCredential"}]')
      end
    end
  end
end
