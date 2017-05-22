require 'spec_helper'

describe FirebaseMessenger::Notification do
  describe '.build' do
    let(:recipient) { 'token-1234' }
    let(:payload) { { body: { title: 'my-title',
                              body: 'this a body' },
                      data: { option_1: true } } }

    subject { described_class.build(recipient, payload) }

    it 'returns FirebaseMessenger::Api::Notification' do
      expect(subject).to be_a(FirebaseMessenger::Api::Notification)
    end

    it 'can be sent' do
      expect(subject.respond_to?(:send)).to eq(true)
    end
  end

  describe '.build_recipient' do
    context 'when recipient is a String' do
      let(:recipient) { 'token-1234' }
      subject { FirebaseMessenger::Notification.build_recipient(recipient) }

      it 'returns an array' do
        expect(subject).to be_an(Array)
        expect(subject.size).to eq(1)
      end
    end

    context 'when recipient is an Array' do
      let(:recipient) { ['token-1234', 'token-5678'] }
      subject { FirebaseMessenger::Notification.build_recipient(recipient) }

      it 'returns an array' do
        expect(subject).to be_an(Array)
        expect(subject.size).to eq(2)
        expect(subject.first).to eq('token-1234')
        expect(subject.last).to eq('token-5678')
      end
    end

    context 'when recipient is a nil' do
      let(:recipient) { nil }
      subject { FirebaseMessenger::Notification.build_recipient(recipient) }

      it 'returns an empty array' do
        expect(subject).to be_an(Array)
        expect(subject.size).to eq(0)
      end
    end

    context 'when recipient have nil string' do
      let(:recipient) { ['token-1234', nil] }
      subject { FirebaseMessenger::Notification.build_recipient(recipient) }

      it 'returns an empty array' do
        expect(subject).to be_an(Array)
        expect(subject.size).to eq(1)
        expect(subject.first).to eq('token-1234')
      end
    end
  end
end
