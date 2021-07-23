# identity-api-client

[![CI Status](https://github.com/controlshift/identity-api-client/actions/workflows/ci.yml/badge.svg)](https://github.com/controlshift/identity-api-client/actions/workflows/ci.yml)

API Client for 38 Degree's Identity API

## Install

This api client is distributed as a ruby gem.

`gem install identity-api-client`

## Usage

```ruby
identity = IdentityApiClient.new(host: 'id.test.com', api_token: 'abc123')
person = identity.member.details('abc123', load_current_consents: true)
person.first_name 
=> 'Jane'
person.last_name
=> 'Smith'
person.consents.first.public_id
=> 'terms_of_service_1.0'
```
