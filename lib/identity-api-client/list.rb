module IdentityApiClient
  class List < Base
    attr_accessor :id

    def attributes
      resp = client.get_request("/api/lists/#{id}?api_token=#{client.connection.configuration.options[:api_token]}")
      if resp.status < 400
        return resp.body
      else
        return resp.body['errors']
      end
    end

    def update(list_attributes)
      params = {
        'api_token' => client.connection.configuration.options[:api_token],
        'list' => list_attributes
      }
      resp = client.put_request("/api/lists/#{id}", params)
      if resp.status < 400
        return self
      else
        return resp.body['errors']
      end
    end

    def delete
      params = {
        'api_token' => client.connection.configuration.options[:api_token]
      }
      resp = client.delete_request("/api/lists/#{id}", params)
      if resp.status < 400
        return self
      else
        return resp.body['errors']
      end
    end
  end
end
