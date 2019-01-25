use v6.c;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::URIRequest;

class WebkitGTK::URIRequest {
  has WebKitURIRequest $!wur;

  submethod BUILD (:$request) {
    $!wur =  $request;
  }
  
  method new {
    self.bless( request => webkit_uri_request_new() );
  }

  method get_http_headers {
    webkit_uri_request_get_http_headers($!wur);
  }

  method get_http_method {
    webkit_uri_request_get_http_method($!wur);
  }

  method get_type {
    webkit_uri_request_get_type();
  }

}
