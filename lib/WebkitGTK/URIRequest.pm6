use v6.c;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::URIRequest;

class WebkitGTK::URIRequest {
  has WebKitURIRequest $!wur;

  submethod BUILD (:$request) {
    $!wur =  $request;
  }

  method WebkitGTK::Raw::Types::WebKitURIRequest {
    $!wur;
  }

  method new (Str() $u) {
    self.bless( request => webkit_uri_request_new($u) );
  }

  method get_http_headers is also<get-http-headers> {
    webkit_uri_request_get_http_headers($!wur);
  }

  method get_http_method is also<get-http-method> {
    webkit_uri_request_get_http_method($!wur);
  }

  method get_type is also<get-type> {
    webkit_uri_request_get_type();
  }

}

