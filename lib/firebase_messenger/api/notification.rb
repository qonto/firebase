module FirebaseMessenger
  module Api
    class Notification < Base
      def send
        response = conn('send', params).post
        return response.json if ok?(response)
        error = FirebaseMessenger::BaseError.new(200, response.results.to_s)
        raise error, error.message unless error.message.to_s.include?('NotRegistered')
      end
    end
  end
end
