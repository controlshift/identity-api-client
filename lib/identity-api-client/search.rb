module IdentityApiClient
  class Search < Base
    attr_accessor :id

    def perform
      resp = client.post_request("/api/searches/#{id}/perform")
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
  end
end