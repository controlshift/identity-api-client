require 'vertebrae'

module IdentityApiClient
  class Client < Vertebrae::API
    def member
      @member ||= IdentityApiClient::Member.new(client: self)
    end

    def mailings
      @mailings ||= IdentityApiClient::Mailings.new(client: self)
    end

    def mailing
      @mailing ||= IdentityApiClient::Mailing.new(client: self)
    end

    def searches
      @searches ||= IdentityApiClient::Searches.new(client: self)
    end

    def search
      @search ||= IdentityApiClient::Search.new(client: self)
    end

    def actions
      @actions ||= IdentityApiClient::Actions.new(client: self)
    end

    def list
      @list ||= IdentityApiClient::List.new(client: self)
    end

    def lists
      @lists ||= IdentityApiClient::Lists.new(client: self)
    end

    private

    def extract_data_from_params(params)
      params.to_json
    end

    def default_options
      {
        user_agent: 'IdentityApiClient',
      }
    end

  end
end
