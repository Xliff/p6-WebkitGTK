use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::MimeInfo;

sub webkit_mime_info_get_description (WebKitMimeInfo $info)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_mime_info_get_mime_type (WebKitMimeInfo $info)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_mime_info_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_mime_info_ref (WebKitMimeInfo $info)
  returns WebKitMimeInfo
  is native(webkit)
  is export
  { * }

sub webkit_mime_info_unref (WebKitMimeInfo $info)
  is native(webkit)
  is export
  { * }

sub webkit_mime_info_get_extensions (WebKitMimeInfo $info)
  returns CArray[Str]
  is native(webkit)
  is export
  { * }
