module IdentityApiClient
  class Mailing < MailingApiBase
    attr_accessor :id
    attr_accessor :name

    def attributes
      resp = client.get_request(route_url("/api/mailings/#{id}?api_token=#{client.connection.configuration.options[:api_token]}"))
      if resp.status < 400
        return resp.body
      else
        return resp.body['errors']
      end
    end

    def update(mailing_attributes)
      params = {
        'api_token' => client.connection.configuration.options[:api_token],
        'mailing' => mailing_attributes
      }
      resp = client.put_request(route_url("/api/mailings/#{id}"), params)
      if resp.status < 400
        return self
      else
        return resp.body['errors']
      end
    end

    def send_sample(email)
      resp = client.post_request(route_url("/api/mailings/#{id}/send_sample"), {email: email})
      resp.status == 202
    end

    def send_mailing(search_id)
      resp = client.post_request(route_url("/api/mailings/#{id}/send"), {search_id: search_id})
      resp.status == 202
    end
  end
end
