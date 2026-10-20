require 'json'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe IdentityApiClient::Member do
  subject { IdentityApiClient.new(host: 'test.com', api_token: '1234567890abcdef') }

  let(:request_path) { '/api/member/details' }

  describe 'failure' do
    context "with no email or guid passed" do
      it "should raise error" do
        expect { subject.member.details() }.to raise_error "Must have one of guid or email"
      end
    end

    context 'when Identity responds with 404' do
      before(:each) do
        stub_post(request_path).to_return(status: 404, body: '404 page not found')
      end

      it 'returns nil instead of raising' do
        expect(subject.member.details(guid: 'abcdef1234567890')).to be_nil
      end
    end
  end

  describe 'success' do
    let(:status) { 200 }

    before(:each) do
      stub_post(request_path).with(body: expected_request).to_return(:body => body, :status => status,
                                                                     :headers => {:content_type => "application/json; charset=utf-8"})
    end

    context 'without load_current_consents' do
      let(:expected_request) { JSON.generate('guid' => 'abcdef1234567890', 'api_token' => '1234567890abcdef') }
      let(:body) { fixture('details.json') }

      it 'should get member details back from the API' do
        resp = subject.member.details(guid: 'abcdef1234567890')

        expect(resp.first_name).to eq('Joe')
        expect(resp.last_name).to eq('Bloggs')
        expect(resp.email).to eq('joe@bloggs.com')
      end
    end


    context 'with load_current_consents' do
      let(:expected_request) { JSON.generate('guid' => 'abcdef1234567890', 'api_token' => '1234567890abcdef', 'load_current_consents' => true) }
      let(:body) { fixture('details_with_consents.json') }

      it 'should get member details with consents back from the API' do
        resp = subject.member.details(guid: 'abcdef1234567890', load_current_consents: true)

        expect(resp.first_name).to eq('Joe')
        expect(resp.last_name).to eq('Bloggs')
        expect(resp.email).to eq('joe@bloggs.com')

        expect(resp.consents.count).to eq 2
        expect(resp.consents[0].public_id).to eq 'terms_of_service_1.0'
      end
    end

    context 'with email passed' do
      let(:expected_request) { JSON.generate('email' => 'test@example.com', 'api_token' => '1234567890abcdef') }
      let(:body) { fixture('details.json') }

      it 'should get member details back from the API' do
        resp = subject.member.details(email: 'test@example.com')

        expect(resp.first_name).to eq('Joe')
        expect(resp.last_name).to eq('Bloggs')
        expect(resp.email).to eq('joe@bloggs.com')
      end
    end
  end
end


