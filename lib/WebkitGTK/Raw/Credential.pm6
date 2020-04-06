use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::Credential;

sub webkit_credential_copy (WebKitCredential $credential)
  returns WebKitCredential
  is native(webkit)
  is export
  { * }

sub webkit_credential_free (WebKitCredential $credential)
  is native(webkit)
  is export
  { * }

sub webkit_credential_get_password (WebKitCredential $credential)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_credential_get_persistence (WebKitCredential $credential)
  returns guint # WebKitCredentialPersistence
  is native(webkit)
  is export
  { * }

sub webkit_credential_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_credential_get_username (WebKitCredential $credential)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_credential_has_password (WebKitCredential $credential)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_credential_new (
  gchar $username,
  gchar $password,
  guint $persistence            # WebKitCredentialPersistence $persistence
)
  returns WebKitCredential
  is native(webkit)
  is export
  { * }
