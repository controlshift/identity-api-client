require 'vertebrae'
require 'identity-api-client/client'
require 'identity-api-client/base'
require 'identity-api-client/member'

module IdentityApiClient
  extend Vertebrae::Base

  class << self
    def new(options = {}, &block)
      IdentityApiClient::Client.new(options, &block)
    end
  end
end
