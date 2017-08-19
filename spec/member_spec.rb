require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe IdentityApiClient::Member do
  subject { IdentityApiClient.new(host: 'test.com', api_token: '1234567890abcdef') }

  let(:request_path) { '/api/member/details' }
  let(:request_body) { fixture('request.json').chomp }

  describe 'success' do
    let(:status) { 200 }
    let(:body) { fixture('details.json') }

    before(:each) do
      stub_post(request_path).with(body: request_body).to_return(:body => body, :status => status,
                                                                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it 'should get member details back from the API' do
      resp = subject.member.details('abcdef1234567890')

      expect(resp.first_name).to eq('Joe')
      expect(resp.last_name).to eq('Bloggs')
      expect(resp.email).to eq('joe@bloggs.com')
    end
  end
end


