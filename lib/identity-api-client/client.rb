module IdentityApiClient
  class Client < Vertebrae::API
    def member
      @member ||= IdentityApiClient::Member.new(client: self)
    end

    private

    def extract_data_from_params(params)
      params.to_json
    end

    def default_options
      {
        user_agent: 'IdentityApiClient'
      }
    end
  end
end
