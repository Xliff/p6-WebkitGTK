use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::URISchemeRequest;

class WebkitGTK::URISchemeRequest {
  has WebKitURISchemeRequest $!wusr;

  submethod BUILD (:$request) {
    $!wusr = $request;
  }

  method new (WebKitURISchemeRequest $request) {
    $request ?? self.bless(:$request) !! Nil;
  }

  method finish (
    GInputStream() $stream,
    Int() $stream_length,
    Str() $mime_type
  ) {
    my gint64 $sl = $stream_length;

    webkit_uri_scheme_request_finish($!wusr, $stream, $sl, $mime_type);
  }

  method finish_error (
    CArray[Pointer[GError]] $error = gerror
  )
    is also<finish-error>
  {
    clear_error;
    webkit_uri_scheme_request_finish_error($!wusr, $error);
    set_error($error);
  }

  method get_path
    is also<
      get-path
      path
    >
  {
    webkit_uri_scheme_request_get_path($!wusr);
  }

  method get_scheme
    is also<
      get-scheme
      scheme
    >
  {
    webkit_uri_scheme_request_get_scheme($!wusr);
  }

  method get_type is also<get-type> {
    webkit_uri_scheme_request_get_type();
  }

  method get_uri
    is also<
      get-uri
      uri
    >
  {
    webkit_uri_scheme_request_get_uri($!wusr);
  }

  method get_web_view (:$raw)
    is also<
      get-web-view
      web_view
      web-view
    >
  {
    my $wv = webkit_uri_scheme_request_get_web_view($!wusr);

    $wv ??
      ( $raw ?? $wv !! ::('WebkitGTK::WebView').new($wv) )
      !!
      Nil;
  }

}
