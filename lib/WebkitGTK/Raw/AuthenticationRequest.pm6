use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::AuthenticationRequest;

sub webkit_authentication_request_authenticate (
  WebKitAuthenticationRequest $request,
  WebKitCredential $credential
)
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_can_save_credentials (
  WebKitAuthenticationRequest $request
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_cancel (
  WebKitAuthenticationRequest $request
)
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_get_host (
  WebKitAuthenticationRequest $request
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_get_port (
  WebKitAuthenticationRequest $request
)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_get_proposed_credential (
  WebKitAuthenticationRequest $request
)
  returns WebKitCredential
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_get_realm (
  WebKitAuthenticationRequest $request
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_get_scheme (
  WebKitAuthenticationRequest $request
)
  returns guint # WebKitAuthenticationScheme
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_is_for_proxy (
  WebKitAuthenticationRequest $request
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_authentication_request_is_retry (
  WebKitAuthenticationRequest $request
)
  returns uint32
  is native(webkit)
  is export
  { * }
