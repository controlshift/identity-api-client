require 'vertebrae'
require 'identity-api-client/client'
require 'identity-api-client/base'
require 'identity-api-client/member'
require 'identity-api-client/mailings'
require 'identity-api-client/mailing'
require 'identity-api-client/searches'
require 'identity-api-client/search'

module IdentityApiClient
  extend Vertebrae::Base

  class << self
    def new(options = {}, &block)
      IdentityApiClient::Client.new(options, &block)
    end
  end
end
