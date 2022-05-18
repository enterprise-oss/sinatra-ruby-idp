## osso idp

This Sinatra app is a simplified Identity Provider for CI, QA and demo purposes.

It runs in production at https://idp.ossoapp.com and can be used by anyone.

A redis instance records email addresses and UUIDs in order to provide consistent IDs for an email address, but you can use any fake email address and any password.

Use [this metadata](metadata.xml) to configure a service provider.

The login form takes any values, and will return a SAML response according to the SAML request.



# sinatra-ruby-idp

This Sinatra app is a simplified Identity Provider for CI, QA and demo purposes.

![features](features.mov)

## Changes from original version

- React frontend
- Removed dependency on Redis
- Dockerize 

## ⌨️ Local development

### Requirements

- Ruby 3.1.2
- Nodejs 16.13.0

### Running

#### Docker

 1. `docker build . -t saml-ruby-idp`
 2. `docker run --rm -p9292:9292 samp-ruby-idp`

#### Ruby 

1. `npm install`
2. `bundle install`
3. `npm run build` *[Build css and javascript assets]*
4. `bundle exec rackup`
5. [Enjoy](http://127.0.0.1:9292) 🎈

Credit to [saml_idp/saml_idp](https://github.com/saml-idp/saml_idp)
image.png and [enterprise-oss/sinatra-ruby-idp][https://github.com/enterprise-oss/sinatra-ruby-idp]
