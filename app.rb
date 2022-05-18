require "sinatra/reloader"
require "sinatra/cookies"
require "zeitwerk"
require "figaro"
loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.setup # ready!

class MockSamlIdpApp < Sinatra::Base
  set :method_override, true
  set :haml, escape_html: false, layout: :application
  enable :raise_errors
  enable :logging
  disable :show_exceptions
  include SamlIdp::Controller

  @user_ids = Hash.new(SecureRandom.uuid)

  helpers do
    def user_ids
      @user_ids ||= Hash.new(SecureRandom.uuid)
    end
  end

  before do
    cache_control :public, :must_revalidate, :max_age => 0
  end

  error 500 do
    send_file('public/500.html')
  end

  error 404 do
    send_file('public/404.html')
  end

  get "/healthcheck" do
    "Yes I am alive"
  end

  get '/' do
    haml :login
  end

  get '/saml-login' do
    haml :login
  end

  post '/decode-saml-request' do
    json = JSON.parse(request.body.read)
    saml_request = json['SAMLRequest']

   {decodedSamlRequest: decode_request(saml_request).raw_xml}.to_json
  end

  post '/saml-login' do
    decode_request(params[:SAMLRequest])

    @saml_response = encode_response(fake_user)

    haml :saml_post
  end

  get '/saml-login-authed' do
    @saml_response = encode_response(fake_user)

    haml :saml_post
  end

  private

  def fake_user
    email_address = params[:username]

    OpenStruct.new({
      email_address: email_address,
      id: user_ids[email_address],
    })
  end
end
