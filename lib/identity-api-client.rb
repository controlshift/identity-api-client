require 'vertebrae'
# dirty patch
spec = Gem::Specification.find_by_name("vertebrae")
require spec.gem_dir + '/lib/api.rb'
require 'identity-api-client/base'
require 'identity-api-client/mailing_api_base'

require 'identity-api-client/actions'
require 'identity-api-client/client'
require 'identity-api-client/lists'
require 'identity-api-client/mailing'
require 'identity-api-client/mailings'
require 'identity-api-client/member'
require 'identity-api-client/search'
require 'identity-api-client/searches'

module IdentityApiClient
  extend Vertebrae::Base

  class << self
    def new(options = {}, &block)
      IdentityApiClient::Client.new(options, &block)
    end
  end
end

# Monkey patch Vertebrae to allow us to deal with 404s ourselves
module Vertebrae
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(response)
        status_code = response[:status].to_i
        return if status_code == 404
        if (400...600).include? status_code
          raise ResponseError.new(status_code, response)
        end
      end
    end
  end # Response::RaiseError
end
