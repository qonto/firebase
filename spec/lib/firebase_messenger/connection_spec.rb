require 'spec_helper'

describe FirebaseMessenger::Connection do
  describe '#get' do
    subject { FirebaseMessenger::Connection.new('notif') }

    it 'makes a get call' do
      request = double

      expect(subject).to receive(:conn).and_return(request)
      expect(request).to receive(:get)
        .with("#{FirebaseMessenger.api_base}/notif", '{}')
        .and_return(double(status: 200, body: '{}'))

      subject.get
    end
  end

  describe '#post' do
    subject { FirebaseMessenger::Connection.new('notif') }

    it 'makes a post call' do
      request = double

      expect(subject).to receive(:conn).and_return(request)
      expect(request).to receive(:post)
        .with("#{FirebaseMessenger.api_base}/notif", '{}')
        .and_return(double(status: 200, body: '{}'))

      subject.post
    end
  end

  describe '#conn' do
    subject { FirebaseMessenger::Connection.new(nil, nil).send(:conn) }

    it 'builds header' do
      expect(subject.headers['project_id']).to eq(FirebaseMessenger.project_id)
      expect(subject.headers['Authorization']).to eq("key=#{FirebaseMessenger.api_key}")
      expect(subject.headers['Content-Type']).to eq('application/json; charset=utf-8')
    end
  end

  describe '#handle_response' do
    subject { FirebaseMessenger::Connection.new('notif') }

    context 'when response 200' do
      before do
        request = double
        expect(subject).to receive(:conn).and_return(request)
        expect(request).to receive(:post).and_return(double(status: 200, body: '{}'))
      end

      it 'builds response' do
        expect(subject).to receive(:build_response).with('{}')
        subject.post
      end
    end

    context 'when response 4xx' do
      before do
        request = double
        expect(subject).to receive(:conn).and_return(request)
        expect(request).to receive(:post).and_return(double(status: 400))
      end

      it 'handle errors' do
        expect(subject).to receive(:handle_error).with(400)
        subject.post
      end
    end
  end
end
