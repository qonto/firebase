module FirebaseMessenger
  module Helpers
    module ErrorsHelper
      def handle_error(status_code)
        case status_code
        when 400
          error = FirebaseMessenger::BadRequest.new(status_code)
        when 401
          error = FirebaseMessenger::Unauthorized.new(status_code)
        when 503
          error = FirebaseMessenger::Unavailable.new(status_code)
        when 500..599
          error = FirebaseMessenger::ServerError.new(status_code)
        end
        raise error.class, error.message
      end
    end
  end
end
