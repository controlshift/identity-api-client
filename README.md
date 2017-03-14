# identity-api-client

[![Build Status](https://travis-ci.org/controlshift/identity-api-client.svg?branch=master)](https://travis-ci.org/controlshift/identity-api-client)

API Client for 38 Degree's Identity API

## Usage

```ruby
identity = IdentityApiClient.new(host: 'id.test.com', api_token: 'abc123')
person = identity.member.details('abc123')
person.first_name 
=> 'Jane'
person.last_name
=> 'Smith'
```
