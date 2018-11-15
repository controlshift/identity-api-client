module IdentityApiClient
  class Mailings < Base
    def find_by_id(id)
      resp = client.get_request("/api/mailings/#{id}")
      if resp.status == 200
        return IdentityApiClient::Mailing.new(client: client, id: id)
      else
        false
      end
    end

    def create(mailing_attributes)
      params = {
        'api_token' => client.connection.configuration.options[:api_token],
        'mailing' => mailing_attributes
      }
      resp = client.post_request('/api/mailings/new', params)
      if resp.status < 400
        return IdentityApiClient::Mailing.new(client: client, id: resp.body['id'])
      else
        return resp.body['errors']
      end
    end
  end
end