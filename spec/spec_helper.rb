$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'identity-api-client'
require 'webmock/rspec'


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.color = true
  config.include WebMock::API

  config.before(:each) do
    WebMock.reset!
  end
  config.after(:each) do
    WebMock.reset!
  end
end

def stub_get(path)
  stub_identity_request(:get, path)
end

def stub_post(path)
  stub_identity_request(:post, path)
end

def stub_identity_request(method, path)
  stub_request(method, "https://test.com" + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, '/', file)).read
end
