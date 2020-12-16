require 'securerandom'
require 'sinatra/base'
require 'sinatra_more/markup_plugin'
require 'redis-sinatra'

class App < Sinatra::Base
  register SinatraMore::MarkupPlugin
  register Sinatra::Cache
  include SamlIdp::Controller

  get '/' do
    puts id
    erb :index
  end

  get '/saml-login' do
    erb :login
  end

  post '/saml-login' do
    decode_request(params[:SAMLRequest])

    @saml_response = encode_response(fake_user)

    erb :saml_post
  end

  get '/saml-login-authed' do
    @saml_response = encode_response(fake_user)

    erb :saml_post
  end

  private

  def fake_user
    email_address = params[:email]
    id = settings.cache.fetch(email_address) { SecureRandom.uuid }

    OpenStruct.new({
      email_address: email_address,
      id: id,
    })
  end
end
