use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::AuthenticationRequest;
use WebkitGTK::Raw::Types;

use GTK::Compat::Roles::Object;

use GTK::Roles::Signals::Generic;

class WebkitGTK::AuthenticationRequest {
  also does GTK::Compat::Roles::Object;
  
  also does GTK::Roles::Signals::Generic;

  has WebKitAuthenticationRequest $!war;

  submethod BUILD (:$request) {
    self!setObject($!war = $request);
  }

  method WebkitGTK::Raw::Types::WebKitAuthenticationRequest 
    is also<AuthenticationRequest>
  { $!war }

  # Is originally:
  # WebKitAuthenticationRequest, gpointer --> void
  method cancelled {
    self.connect($!war, 'cancelled');
  }

  method authenticate (WebKitCredential() $credential) {
    webkit_authentication_request_authenticate($!war, $credential);
  }

  method can_save_credentials is also<can-save-credentials> {
    so webkit_authentication_request_can_save_credentials($!war);
  }

  method cancel {
    webkit_authentication_request_cancel($!war);
  }

  method get_host 
    is also<
      get-host
      host
    > 
  {
    webkit_authentication_request_get_host($!war);
  }

  method get_port 
    is also<
      get-port
      port
    > 
  {
    webkit_authentication_request_get_port($!war);
  }

  method get_proposed_credential 
    is also<
      get-proposed-credential
      proposed_credential
      proposed-credential
    > 
  {
    WebkitGTK::Credential.new(
      webkit_authentication_request_get_proposed_credential($!war)
    );
  }

  method get_realm 
    is also<
      get-realm
      realm
    > 
  {
    webkit_authentication_request_get_realm($!war);
  }

  method get_scheme 
    is also<
      get-scheme
      scheme
    > 
  {
    WebKitAuthenticationScheme(
      webkit_authentication_request_get_scheme($!war)
    );
  }

  method get_type is also<get-type> {
    webkit_authentication_request_get_type();
  }

  method is_for_proxy is also<is-for-proxy> {
    so webkit_authentication_request_is_for_proxy($!war);
  }

  method is_retry is also<is-retry> {
    so webkit_authentication_request_is_retry($!war);
  }

}
