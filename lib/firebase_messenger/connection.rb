module FirebaseMessenger
  class Connection
    include FirebaseMessenger::Helpers::ErrorsHelper
    include FirebaseMessenger::Helpers::ResponseHelper

    attr_reader :url, :body

    def initialize(url, body = {})
      @url = url
      @body = body
    end

    def get
      handle_response { conn.send(:get, "#{base_url}/#{url}", body.to_json) }
    end

    def post
      handle_response { conn.send(:post, "#{base_url}/#{url}", body.to_json) }
    end

    private

    def handle_response
      response = yield
      return build_response(response.body) if response.status == 200
      handle_error(response.status)
    end

    def base_url
      FirebaseMessenger.api_base
    end

    def conn
      Faraday.new do |req|
        req.adapter :httpclient
        req.headers['project_id']    = FirebaseMessenger.project_id
        req.headers['Content-Type']  = 'application/json; charset=utf-8'
        req.headers['Authorization'] = "key=#{FirebaseMessenger.api_key}"
      end
    end
  end
end
