module IdentityApiClient
  class Searches < Base
    def find_by_id(id)
      resp = client.get_request("/api/searches/#{id}?api_token=#{client.connection.configuration.options[:api_token]}")
      if resp.status == 200
        return IdentityApiClient::Search.new(client: client, id: id)
      else
        false
      end
    end

    def create(search_attributes)
      params = {
        'api_token' => client.connection.configuration.options[:api_token],
        'search' => search_attributes
      }
      resp = client.post_request('/api/searches/new', params)
      if resp.status < 400
        return IdentityApiClient::Search.new(client: client, id: resp.body['id'])
      else
        return resp.body['errors']
      end
    end
  end
end
