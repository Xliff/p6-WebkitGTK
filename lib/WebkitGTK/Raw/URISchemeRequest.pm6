use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::URISchemeRequest;

sub webkit_uri_scheme_request_finish (
  WebKitURISchemeRequest $request,
  GInputStream $stream,
  gint64 $stream_length,
  Str $mime_type
)
  is native(webkit)
  is export
  { * }

sub webkit_uri_scheme_request_finish_error (
  WebKitURISchemeRequest $request,
  CArray[Pointer[GError]] $error
)
  is native(webkit)
  is export
  { * }

sub webkit_uri_scheme_request_get_path (WebKitURISchemeRequest $request)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_uri_scheme_request_get_scheme (WebKitURISchemeRequest $request)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_uri_scheme_request_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_uri_scheme_request_get_uri (WebKitURISchemeRequest $request)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_uri_scheme_request_get_web_view (WebKitURISchemeRequest $request)
  returns WebKitWebView
  is native(webkit)
  is export
  { * }
