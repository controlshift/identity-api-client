require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe IdentityApiClient::Mailings do
  let!(:api_token) { "1234567890abcdef" }
  subject { IdentityApiClient.new(host: 'test.com', api_token: api_token) }

  describe 'uses an overriden mailing API path when provided as an option' do
    let(:status) { 200 }
    let(:body) { fixture('new_mailing_response.json') }
    let(:request_path) { 'https://test.com/mailings/api/mailings' }
    let(:request_body) { fixture('new_mailing_request.json').chomp }
    let(:overriden_subject) { IdentityApiClient.new(host: 'test.com', api_token: '1234567890abcdef', mailing_api_path: '/mailings') }

    before(:each) do
      stub_request(:post, request_path).to_return(status: 200, body: body, headers: {:content_type => "application/json; charset=utf-8"} )
    end

    it 'should return a new Mailing with the correct ID' do
      mailing = overriden_subject.mailings.create({name: "TEST mailing"})
      expect(mailing).to be_kind_of(IdentityApiClient::Mailing)
      expect(mailing.id).to eq(5)
    end

  end

  describe 'creating a new mailing' do
    let(:status) { 200 }
    let(:body) { fixture('new_mailing_response.json') }
    let(:request_path) { 'https://test.com/api/mailings' }
    let(:request_body) { fixture('new_mailing_request.json').chomp }

    before(:each) do
      stub_request(:post, request_path).to_return(status: 200, body: body, headers: {:content_type => "application/json; charset=utf-8"} )
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
    let(:request_path) { "https://test.com/api/mailings/5?api_token=#{api_token}" }

    before(:each) do
      stub_request(:get, request_path).to_return(status: 200, body: body, headers: {:content_type => "application/json; charset=utf-8"} )
    end

    it 'should return a new Mailing with the correct ID' do
      mailing = subject.mailings.find_by_id(5)
      expect(mailing).to be_kind_of(IdentityApiClient::Mailing)
      expect(mailing.id).to eq(5)
    end
  end
end
