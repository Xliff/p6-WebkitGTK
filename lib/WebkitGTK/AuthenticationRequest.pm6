use v6.c;

use NativeCall;

use WebkitGTK::Raw::AuthenticationRequest;
use WebkitGTK::Raw::Types;

use GTK::Roles::Signals::Generic;

class WebkitGTK::AuthenticationRequest {
  also does GTK::Roles::Signals::Generic;

  has WebKitAuthenticationRequest $!war;

  submethod BUILD (:$request) {
    $!war = $request;
  }

  method WebkitGTK::Raw::Types::WebKitAuthenticationRequest {
    $!war;
  }

  # Is originally:
  # WebKitAuthenticationRequest, gpointer --> void
  method cancelled {
    self.connect($!war, 'cancelled');
  }

  method authenticate (WebKitCredential() $credential) {
    webkit_authentication_request_authenticate($!war, $credential);
  }

  method can_save_credentials {
    so webkit_authentication_request_can_save_credentials($!war);
  }

  method cancel {
    webkit_authentication_request_cancel($!war);
  }

  method get_host {
    webkit_authentication_request_get_host($!war);
  }

  method get_port {
    webkit_authentication_request_get_port($!war);
  }

  method get_proposed_credential {
    WebkitGTK::Credential.new(
      webkit_authentication_request_get_proposed_credential($!war)
    );
  }

  method get_realm {
    webkit_authentication_request_get_realm($!war);
  }

  method get_scheme {
    WebKitAuthenticationScheme(
      webkit_authentication_request_get_scheme($!war)
    );
  }

  method get_type {
    webkit_authentication_request_get_type();
  }

  method is_for_proxy {
    so webkit_authentication_request_is_for_proxy($!war);
  }

  method is_retry {
    so webkit_authentication_request_is_retry($!war);
  }

}
