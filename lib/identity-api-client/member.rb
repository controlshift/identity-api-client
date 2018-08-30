module IdentityApiClient
  class Member < Base
    def details(guid_or_email, load_current_consents: false)
      if guid_or_email.include? '@'
        params = {'email' => guid_or_email, 'api_token' => client.connection.configuration.options[:api_token]}
      else
        params = {'guid' => guid_or_email, 'api_token' => client.connection.configuration.options[:api_token]}
      end

      if load_current_consents
        params['load_current_consents'] = true
      end

      resp = client.post_request('/api/member/details', params)
      resp.body
    end
  end
end
