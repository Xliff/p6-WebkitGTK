use v6.c;

use Cairo;
use NativeCall;

use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::FaviconDatabase;

sub webkit_favicon_database_clear (WebKitFaviconDatabase $database)
  is native(webkit)
  is export
  { * }

sub webkit_favicon_database_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }

sub webkit_favicon_database_get_favicon (
  WebKitFaviconDatabase $database,
  Str $page_uri,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data)
  is native(webkit)
  is export
  { * }

sub webkit_favicon_database_get_favicon_finish (
  WebKitFaviconDatabase $database,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns cairo_surface_t
  is native(webkit)
  is export
  { * }

sub webkit_favicon_database_get_favicon_uri (
  WebKitFaviconDatabase $database,
  Str $page_uri
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_favicon_database_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
