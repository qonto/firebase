module FirebaseMessenger
  module Helpers
    # To simplify response handle
    module ResponseHelper
      def build_response(response)
        json = JSON.parse(response, symbolize_names: true)
        FirebaseMessenger::Api::Response.build(json)
      end
    end
  end
end
