use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WebResource;

sub webkit_web_resource_get_data (
  WebKitWebResource $resource,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_resource_get_data_finish (
  WebKitWebResource $resource,
  GAsyncResult $result,
  gsize $length is rw,
  CArray[Pointer[GError]] $error
)
  returns CArray[uint8]
  is native(webkit)
  is export
  { * }

sub webkit_web_resource_get_response (WebKitWebResource $resource)
  returns WebKitURIResponse
  is native(webkit)
  is export
  { * }

sub webkit_web_resource_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_web_resource_get_uri (WebKitWebResource $resource)
  returns Str
  is native(webkit)
  is export
  { * }
