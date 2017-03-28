# identity-api-client

[![Build Status](https://travis-ci.org/controlshift/identity-api-client.svg?branch=master)](https://travis-ci.org/controlshift/identity-api-client)

API Client for 38 Degree's Identity API

## Install

This api client is distributed as a ruby gem.

`gem install identity-api-client`

## Usage

```ruby
identity = IdentityApiClient.new(host: 'id.test.com', api_token: 'abc123')
person = identity.member.details('abc123')
person.first_name 
=> 'Jane'
person.last_name
=> 'Smith'
```

Example of setting up a target list and sending an email

```ruby
identity = IdentityApiClient.new(host: 'id.test.com', api_token: 'abc123')
mailing = identity.mailings.create({name: "My first API mailing"})
mailing.id
=> 1

mailing = identity.mailings.find_by_id(1)
mailing.update({body: "<p>Bla bla</p>", subject: "Hey!"})

action = identity.actions.find_by(name: "My first petition")
action.id
=> 56

rules = {"include":{"condition":"AND","rules":[{"id":"has-taken-action","field":"has-taken-action","type":"string","operator":"in","value":[action.id]}]},"exclude":{"condition":"OR","rules":[{"id":"noone","field":"noone","type":"string","operator":"equal","value":"on"}]}}

search = identity.searches.create({rules: rules})

mailing.send_mailing(search.id)
=> true
```
