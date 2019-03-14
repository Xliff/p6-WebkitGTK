use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::URISchemeRequest;

class WebkitGTK::URISchemeRequest {
  has WebKitURISchemeRequest $!wusr;

  submethod BUILD (:$request) {
    $!wusr = $request;
  }

  method new (WebKitURISchemeRequest $request) {
    self.bless(:$request);
  }

  method finish (
    GInputStream $stream,
    Int() $stream_length,
    Str() $mime_type
  ) {
    my gint64 $sl = self.RESOLVE-LONG($stream_length);
    webkit_uri_scheme_request_finish($!wusr, $stream, $sl, $mime_type);
  }

  method finish_error (
    CArray[Pointer[GError]] $error = gerror
  ) 
    is also<finish-error> 
  {
    $ERROR = Nil;
    my $rc = webkit_uri_scheme_request_finish_error($!wusr, $error);
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  method get_path is also<get-path> {
    webkit_uri_scheme_request_get_path($!wusr);
  }

  method get_scheme is also<get-scheme> {
    webkit_uri_scheme_request_get_scheme($!wusr);
  }

  method get_type is also<get-type> {
    webkit_uri_scheme_request_get_type();
  }

  method get_uri is also<get-uri> {
    webkit_uri_scheme_request_get_uri($!wusr);
  }

  method get_web_view is also<get-web-view> {
    ::('WebkitGTK::WebView').new(
      webkit_uri_scheme_request_get_web_view($!wusr)
    );
  }

}