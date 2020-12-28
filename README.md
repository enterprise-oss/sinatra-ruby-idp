## osso idp

This Sinatra app is a simplified Identity Provider for CI, QA and demo purposes.

It runs in production at https://idp.ossoapp.com and can be used by anyone.

A redis instance records email addresses and UUIDs in order to provide consistent IDs for an email address, but you can use any fake email address and any password.

Use [this metadata](metadata.xml) to configure a service provider.

The login form takes any values, and will return a SAML response according to the SAML request.

Credit to [saml_idp/saml_idp](https://github.com/saml-idp/saml_idp)
