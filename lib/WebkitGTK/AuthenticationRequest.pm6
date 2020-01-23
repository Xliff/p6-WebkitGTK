use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::AuthenticationRequest;
use WebkitGTK::Raw::Types;

use GLib::Roles::Object;
use GLib::Roles::Signals::Generic;

class WebkitGTK::AuthenticationRequest {
  also does GLib::Roles::Object;
  also does GLib::Roles::Signals::Generic;

  has WebKitAuthenticationRequest $!war;

  submethod BUILD (:$request) {
    self!setObject($!war = $request);
  }

  method WebkitGTK::Raw::Definitions::WebKitAuthenticationRequest
    is also<
      AuthenticationRequest
      WebKitAuthenticationRequest
    >
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
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_authentication_request_get_type,
      $n,
      $t
    );
  }

  method is_for_proxy is also<is-for-proxy> {
    so webkit_authentication_request_is_for_proxy($!war);
  }

  method is_retry is also<is-retry> {
    so webkit_authentication_request_is_retry($!war);
  }

}
