require 'spec_helper'

describe FirebaseMessenger::Helpers::ErrorsHelper do
  describe '#handle_error' do
    describe 'When status 400' do
      it 'returns FirebaseMessenger::BadRequest' do
        expect { handle_error(400) }.to raise_error(FirebaseMessenger::BadRequest)
      end
    end

    describe 'When status 401' do
      it 'returns FirebaseMessenger::Unauthorized' do
        expect { handle_error(401) }.to raise_error(FirebaseMessenger::Unauthorized)
      end
    end

    describe 'When status 503' do
      it 'returns FirebaseMessenger::Unavailable' do
        expect { handle_error(503) }.to raise_error(FirebaseMessenger::Unavailable)
      end
    end

    describe 'When status 50X' do
      it 'returns FirebaseMessenger::BadRequest' do
        expect { handle_error(500) }.to raise_error(FirebaseMessenger::ServerError)
        expect { handle_error(510) }.to raise_error(FirebaseMessenger::ServerError)
        expect { handle_error(520) }.to raise_error(FirebaseMessenger::ServerError)
        expect { handle_error(599) }.to raise_error(FirebaseMessenger::ServerError)
      end
    end
  end
end
