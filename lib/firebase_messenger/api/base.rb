module FirebaseMessenger
  module Api
    class Base
      include FirebaseMessenger::Helpers::ConnectHelper
      include FirebaseMessenger::Helpers::ErrorsHelper

      attr_reader :recipient, :body, :options

      def initialize(recipient = [], body = {}, options = {})
        @body      = body
        @options   = options
        @recipient = recipient
      end

      def params
        { registration_ids: recipient }.merge(notification: body).merge(options)
      end

      private

      def ok?(response)
        return true if response.status == 200
        handle_error(response.status)
      end
    end
  end
end
