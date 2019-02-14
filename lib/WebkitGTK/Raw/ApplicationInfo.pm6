use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::ApplicationInfo;

sub webkit_application_info_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_application_info_get_version (
  WebKitApplicationInfo $info,
  uint64 $major is rw,
  uint64 $minor is rw,
  uint64 $micro is rw
)
  is native(webkit)
  is export
  { * }

sub webkit_application_info_new ()
  returns WebKitApplicationInfo
  is native(webkit)
  is export
  { * }

sub webkit_application_info_ref (WebKitApplicationInfo $info)
  returns WebKitApplicationInfo
  is native(webkit)
  is export
  { * }

sub webkit_application_info_set_version (
  WebKitApplicationInfo $info,
  uint64 $major,
  uint64 $minor,
  uint64 $micro
)
  is native(webkit)
  is export
  { * }

sub webkit_application_info_unref (WebKitApplicationInfo $info)
  is native(webkit)
  is export
  { * }

sub webkit_application_info_get_name (WebKitApplicationInfo $info)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_application_info_set_name (
  WebKitApplicationInfo $info,
  Str $name
)
  is native(webkit)
  is export
  { * }
