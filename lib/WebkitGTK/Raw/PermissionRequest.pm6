use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::PermissionRequest;

sub webkit_permission_request_allow (WebKitPermissionRequest $request)
  is native(webkit)
  is export
  { * }

sub webkit_permission_request_deny (WebKitPermissionRequest $request)
  is native(webkit)
  is export
  { * }

sub webkit_permission_request_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
