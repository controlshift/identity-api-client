module IdentityApiClient
  class Mailing < Base
    attr_accessor :id

    def attributes

    end

    def update(mailing_attributes)
      params = {
        'api_token' => client.connection.configuration.options[:api_token],
        'mailing' => mailing_attributes
      }
      resp = client.put_request("/api/mailings/#{id}", params)
      if resp.status < 400
        return self
      else
        return resp.body['errors']
      end
    end

    def send_mailing(search_id)

    end
  end
end