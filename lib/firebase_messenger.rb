require 'faraday'
require 'json'
require 'httpclient'
require 'pry'

require 'firebase_messenger/connection'
require 'firebase_messenger/errors'

require 'firebase_messenger/helpers/connect_helper'
require 'firebase_messenger/helpers/errors_helper'

require 'firebase_messenger/api/base'
require 'firebase_messenger/api/notification'

require 'firebase_messenger/notification'

require 'firebase_messenger/firebase_messenger'

# This is start point of the Genm
module FirebaseMessenger
  @api_base = 'https://fcm.googleapis.com/fcm'

  class << self
    attr_accessor :project_id, :api_key, :api_base

    def config
      return options unless block_given?
      yield self
    end

    def options
      { project_id: project_id,
        api_key: api_key,
        api_base: api_base }
    end
  end
end
