# sinatra-ruby-idp

This Sinatra app is a simplified Identity Provider for CI, QA and demo purposes.


https://user-images.githubusercontent.com/783501/168935031-caab559e-7b5d-4056-96d6-f3f96d584499.mov


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
