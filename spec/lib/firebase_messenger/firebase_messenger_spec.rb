require 'spec_helper'

describe FirebaseMessenger do
  subject { described_class }

  describe '.register_interceptor' do
    it 'add a new interceptor' do
      expect { subject.register_interceptor('lol') }.to change { subject.interceptors.size }.from(0).to(1)
    end
  end

  describe '.unregister_interceptor' do
    it 'removes an interceptor' do
      expect { subject.unregister_interceptor('lol') }.to change { subject.interceptors.size }.from(1).to(0)
    end
  end

  describe '.register_observer' do
    it 'add a new observer' do
      expect { subject.register_observer('lol') }.to change { subject.observers.size }.from(0).to(1)
    end
  end

  describe '.unregister_observer' do
    it 'removes an observer' do
      expect { subject.unregister_observer('lol') }.to change { subject.observers.size }.from(1).to(0)
    end
  end
end
