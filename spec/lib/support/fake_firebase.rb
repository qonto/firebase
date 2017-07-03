require 'json'
require 'sinatra/base'

class FakeFirebase < Sinatra::Base
  post '/fcm/send' do
    content_type :json

    params = JSON.parse(request.body.read, symbolize_names: true)

    if params[:notification][:failure]
      json_response(200, 'apn_invalid')
    else
      json_response(200, 'ok')
    end
  end

  private

  def json_response(status, path)
    content_type :json
    IO.read("spec/lib/support/fixtures/#{path}.json")
  end
end
