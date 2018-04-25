module IdentityApiClient
  class Member < Base
    def details(guid, load_current_consents: false)
      params = {'guid' => guid, 'api_token' => client.connection.configuration.options[:api_token]}
      if load_current_consents
        params['load_current_consents'] = true
      end

      resp = client.post_request('/api/member/details', params)
      resp.body
    end
  end
end
