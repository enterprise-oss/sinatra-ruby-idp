# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'


if ENV['RACK_ENV'].nil? || ENV['RACK_ENV'] == 'development'
  require 'dotenv/load'
  require 'pry'
end

Bundler.require

require './app'

SamlIdp.configure do |config|
  base = "http://example.com"

  config.x509_certificate = <<-CERT
-----BEGIN CERTIFICATE-----
MIIDtjCCAp4CCQCkrp2ger3dDzANBgkqhkiG9w0BAQsFADCBnDELMAkGA1UEBhMC
VVMxETAPBgNVBAgMCE5ldyBZb3JrMREwDwYDVQQHDAhCcm9va2x5bjEWMBQGA1UE
CgwNRW50ZXJwcmlzZU9TUzENMAsGA1UECwwEZGVtbzEaMBgGA1UEAwwRZW50ZXJw
cmlzZW9zcy5kZXYxJDAiBgkqhkiG9w0BCQEWFXNhbUBlbnRlcnByaXNlb3NzLmRl
djAeFw0yMDEyMDkyMTU5MjVaFw0yMTEyMDkyMTU5MjVaMIGcMQswCQYDVQQGEwJV
UzERMA8GA1UECAwITmV3IFlvcmsxETAPBgNVBAcMCEJyb29rbHluMRYwFAYDVQQK
DA1FbnRlcnByaXNlT1NTMQ0wCwYDVQQLDARkZW1vMRowGAYDVQQDDBFlbnRlcnBy
aXNlb3NzLmRldjEkMCIGCSqGSIb3DQEJARYVc2FtQGVudGVycHJpc2Vvc3MuZGV2
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArAIu2YeGZaEK2AopN9er
mX3iHzkUuwPvnS79VSXVZhjZOwSS4aJl+RGktZjtUyvorRm+kGlvZ1YJFux53scm
XhUYc8bt/eyoB248TVnnUuZlb1Ms/OTahkNZGO1bQ2QxK2uIUYANbWt/3MKe1maw
3bh+aUWewWfuc0yk6uy/P0SBn3pwA58CUcBdMqI3mKNWPIb766XnvHAnoium+QfA
BbWl+MRN13pryrzfjkZJjev6U6IwWYhmbQ88HW45M+BHZAO2WuZYo5bKOUtKPJqS
QisB/Sw+v0VG4uNgb+6zwrUgpPY5d6En15mWbUBPtaoAqaxWd7wpEZXAJ3EIKxw6
bQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCoSC+hc5UKWc7MO5UXU+6D+e7c0RVO
ls/DQzNtzZnjpkN8wWq3fpNLRx/mGamDAnkmjZK2kGqWkfizRqaAksWcpaRHz6mS
UvwKVA15pOBUu+qIn+0rR7wRKTglfNWtrEKPONea1uNrB271XiYdLrxGSCAQXndW
W7vo6N3DJJXRFCxUkL1W4CFEkUTG7KZuZsjpN3z9i9p/i+n9pEvfDj5x/1zoD0PI
pnyrU+VLvVMUlHeklsVMC8C9XgYRWtJqJVuIrK1BraBNhZrvg8HkKLIxqU4ayc2r
hlYTLC++fXIqgXlZXFwjjoWmze9+xWs+JXCN8K9hZ+YA13E8kLKcTHAD
-----END CERTIFICATE-----
  CERT

  config.secret_key = <<-CERT
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEArAIu2YeGZaEK2AopN9ermX3iHzkUuwPvnS79VSXVZhjZOwSS
4aJl+RGktZjtUyvorRm+kGlvZ1YJFux53scmXhUYc8bt/eyoB248TVnnUuZlb1Ms
/OTahkNZGO1bQ2QxK2uIUYANbWt/3MKe1maw3bh+aUWewWfuc0yk6uy/P0SBn3pw
A58CUcBdMqI3mKNWPIb766XnvHAnoium+QfABbWl+MRN13pryrzfjkZJjev6U6Iw
WYhmbQ88HW45M+BHZAO2WuZYo5bKOUtKPJqSQisB/Sw+v0VG4uNgb+6zwrUgpPY5
d6En15mWbUBPtaoAqaxWd7wpEZXAJ3EIKxw6bQIDAQABAoIBAEgKQgTpNeiqohgJ
aWnx8fS/PE1HYt9QrrJuU7uttMql7ZVCPSIzGfJO6WUFP6Bt621UMvPYtMfayMPJ
FuGvFuqgezVCQ7rtuxIhoS/kT3Xw+Nq/Q0BHuR4yZsaB4o8/DzjYOKepsfX55/tV
p6C0Ma8q7ga5Gdx24u93UjryHMcqAhdrWKZvDxLos8777VVupkRQt4scftDm2FKC
f2+xfTHOKqmYlfdi90nUVhIbksPVAXYibp44YmvPxiVOnpH5XtbIQVyLRCbToHYF
Rp5LXYpdnwTRPHup+9QFiAyvZ+Z8r6R94w+lbzM5URs/bVbx0XABKLav4/BVueyn
JommAgECgYEA2jOGbcX9yNf9OgZRJdOJbQC92vVsqw9hl6qJMR2ZWjDt9PRSjrMa
3bAoQxW1fG1qJ+swGlkG1DIH3CTnqqUflSxE5rDIidBD7J57J2hFUACQhCAYNyZ9
BwNtpdAuZ4FAEhvfajM2yex7aIIztMFbAKfAof5MQoBHaphDArykqRECgYEAyc4r
OOqDQMT5nhCjLc/iEMBPLH3CW/al3iZkI8LzA/tS9CwIsclV8TiKnSgw86IdCzwD
nPjnow3d8iqfJKzSmIyW91B2SxzSA6R1lhMQlA3d2uJfmfGDKW7HxCdndvRWobzR
y8iNTAFF+5X8CRl5YIpwleJWqB0d44b2VF2P250CgYEAmhpbrXlwhAEvAWTmuK1O
WGJ2s4Yzahhh12iEneCGprD5zc8j405RAhJgTQiu9SKdH3Y1sdYAQarX7D1QNC+M
P6FVRAvEhbhF0H4ZAjrdAOR1LCsyjviqwmJEdR+zNjyNUHzI68shvbg7bBLQi68n
Iy5WmNHtb+YDCiBg6zTpodECgYBtpjjz5vBEDAK5ML8JEE/73BHo0bf+Mejz6JY2
nCFgw3jSNO7Qct3ggGFIfOMELcxsI0KvUsrBXLKAd0obKlAPFSyd2jk8HL+7vOsr
DNbQKyylVqStR32F0Kx4VxSvnJlJrgesGx8y8eothdP4ub+qhe4gcme1VoS78MP9
GQ0mPQKBgQCMTTkJiYcUXzQDrTys7Mxt8DZTomiHIA7q3OPUCKzaiVKg5JTxHrhj
LvPbkF43KLZX2lr5axMd1G4O0lc3omn7zu5ighrEd7Aqyxyjd3+HKNP57fd+Lm/o
s5KE/wRHVCznRNcjx69MmeZLuMHikLvTxYxqJCgSj6StbdI3b6RXpw==
-----END RSA PRIVATE KEY-----
CERT
  
  config.signed_message = true
  config.name_id.formats = {
    email_address: -> (principal) { principal.email_address },
    transient: -> (principal) { principal.id },
    persistent: -> (p) { p.id },
  }

  config.attributes = {
    idp_id: {
      getter: :id,
    },
    email: {
      getter: :email_address
    }
  }
end

run App
