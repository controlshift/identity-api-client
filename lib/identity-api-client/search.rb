module IdentityApiClient
  class Search < Base
    attr_accessor :id

    def perform(params = {})
      params = { 'api_token' => client.connection.configuration.options[:api_token] }.merge(params)
      resp = client.post_request("/api/searches/#{id}/perform", params)
      resp.status == 202
    end

    def get_count
      resp = client.get_request("/api/searches/#{id}/count")
      if resp.status == 200
        return resp.body['total_members']
      else
        false
      end
    end

    def push_to_list(params = {})
      params = { 'api_token' => client.connection.configuration.options[:api_token] }.merge(params)
      resp = client.post_request("/api/searches/#{id}/push_to_list", params)
      resp.status == 202
    end
  end
end
