module FirebaseMessenger
  module Api
    class Response < OpenStruct
      attr_accessor :json
      def self.build(json)
        new(json)
      end

      def initialize(json)
        super(json)
        @json = json
      end
    end
  end
end
