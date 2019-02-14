use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::SecurityManager;

sub webkit_security_manager_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_register_uri_scheme_as_cors_enabled (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_register_uri_scheme_as_display_isolated (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_register_uri_scheme_as_empty_document (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_register_uri_scheme_as_local (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_register_uri_scheme_as_no_access (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_register_uri_scheme_as_secure (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_uri_scheme_is_cors_enabled (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_uri_scheme_is_display_isolated (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_uri_scheme_is_empty_document (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_uri_scheme_is_local (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_uri_scheme_is_no_access (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_security_manager_uri_scheme_is_secure (
  WebKitSecurityManager $security_manager,
  Str $scheme
)
  returns uint32
  is native(webkit)
  is export
  { * }
