require 'spec_helper'

describe FirebaseMessenger do
  subject { described_class }

  describe '.api_base' do
    it 'rerturns default api_base' do
      expect(subject.api_base).to eq('https://fcm.googleapis.com/fcm')
    end

    it 'updates api_base' do
      subject.api_base = 'https://domain.con'
      expect(subject.api_base).to eq('https://domain.con')
    end
  end

  describe '.api_key' do
    it 'returns default api_key' do
      expect(subject.api_key).to eq(nil)
    end

    it 'updates api_key' do
      subject.api_key = '123ABC'
      expect(subject.api_key).to eq('123ABC')
    end
  end

  describe '.project_id' do
    it 'returns default api_key' do
      expect(subject.project_id).to eq(nil)
    end

    it 'updates project_id' do
      subject.project_id = 'projectId'
      expect(subject.project_id).to eq('projectId')
    end
  end

  describe '.config' do
    context 'when block passed' do
      before do
        subject.config do |config|
          config.api_key = nil
          config.api_base = 'https://fcm.googleapis.com/fcm'
          config.project_id = nil
        end
      end

      it 'set configuration' do
        expect(subject.api_key).to eq(nil)
        expect(subject.project_id).to eq(nil)
        expect(subject.api_base).to eq('https://fcm.googleapis.com/fcm')
      end
    end

    context 'when no block passed' do
      it 'calls options' do
        expect(subject).to receive(:options)
        subject.config
      end
    end
  end

  describe '#options' do
    subject { described_class.options }

    it 'returns config' do
      expect(subject).to be_a(Hash)
      expect(subject.keys).to include(:project_id, :api_key, :api_base)
    end
  end
end
