use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::URIResponse;

sub webkit_uri_response_get_content_length (WebKitURIResponse $respnose)
  returns guint64
  is native(webkit)
  is export
  { * }

sub webkit_uri_response_get_http_headers (WebKitURIResponse $response)
  returns SoupMessageHeaders
  is native(webkit)
  is export
  { * }

sub webkit_uri_response_get_mime_type (WebKitURIResponse $response)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_uri_response_get_status_code (WebKitURIResponse $response)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_uri_response_get_suggested_filename (WebKitURIResponse $response)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_uri_response_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_uri_response_get_uri (WebKitURIResponse $response)
  returns Str
  is native(webkit)
  is export
  { * }
