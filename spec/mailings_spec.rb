require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe IdentityApiClient::Mailings do
  subject { IdentityApiClient.new(host: 'test.com', api_token: '1234567890abcdef') }

  

  describe 'creating a new mailing' do

    let(:status) { 200 }
    let(:body) { fixture('new_mailing_response.json') }
    let(:request_path) { '/api/mailings/new' }
    let(:request_body) { fixture('new_mailing_request.json').chomp }

    before(:each) do
      stub_post(request_path).with(body: request_body).to_return(:body => body, :status => status,
                                                                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it 'should return a new Mailing with the correct ID' do
      mailing = subject.mailings.create({name: "TEST mailing"})
      expect(mailing).to be_kind_of(IdentityApiClient::Mailing)
      expect(mailing.id).to eq(5)
    end

  end

  describe 'retrieving a mailing by ID' do 
    let(:status) { 200 }
    let(:body) { fixture('get_mailing_response.json') }
    let(:request_path) { '/api/mailings/5' }

    before(:each) do
      stub_get(request_path).to_return(:body => body, :status => status,
                                                                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it 'should return a new Mailing with the correct ID' do
      mailing = subject.mailings.find_by_id(5)
      expect(mailing).to be_kind_of(IdentityApiClient::Mailing)
      expect(mailing.id).to eq(5)
    end
  end
end