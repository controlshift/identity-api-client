module IdentityApiClient
  class Actions < Base
    def find_by(action_attributes)
      resp = client.get_request("/api/actions/find_by", action: action_attributes)
      if resp.status == 200
        return IdentityApiClient::Mailing.new(client: client, id: resp.body['id'])
      else
        false
      end
    end
  end
end