module IdentityApiClient
  class Member < Base
    def details(guid)
      params = {'guid' => guid, 'api_token' => client.connection.configuration.options[:api_token]}

      resp = client.post_request('/api/member/details', params)
      resp.body
    end
  end
end
