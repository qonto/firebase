module FirebaseMessenger
  module Api
    class Base
      include FirebaseMessenger::Helpers::ConnectHelper

      attr_reader :recipient, :body, :options

      def initialize(recipient = [], body = {}, options = {})
        @body      = body
        @options   = options
        @recipient = recipient
      end

      def params
        { registration_ids: recipient, notification: body }.merge(options)
      end

      private

      def ok?(response)
        response.failure.zero?
      end
    end
  end
end
