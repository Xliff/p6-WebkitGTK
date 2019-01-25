use v6.c;

use GTK::Compat::Types;
use WebkitGTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::URIRequest;

sub webkit_uri_request_get_http_headers (WebKitURIRequest $request)
  returns SoupMessageHeaders
  is native(webkit)
  is export
  { * }

sub webkit_uri_request_get_http_method (WebKitURIRequest $request)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_uri_request_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_uri_request_new (Str $uri)
  returns WebKitURIRequest
  is native(webkit)
  is export
  { * }

sub webkit_uri_request_get_uri (WebKitURIRequest $request)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_uri_request_set_uri (WebKitURIRequest $request, Str $uri)
  is native(webkit)
  is export
  { * }
