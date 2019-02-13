use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::URIResponse;

class WebkitGTK::URIResponse {
  has WebKitURIResponse $!wurr;

  submethod BLESS(:$response) {
    $!wurr = $response;
  }

  method WebkitGTK::Raw::Types::WebKitURIResponse {
    $!wurr;
  }

  method get_content_length {
    webkit_uri_response_get_content_length($!wurr);
  }

  method get_http_headers {
    webkit_uri_response_get_http_headers($!wurr);
  }

  method get_mime_type {
    webkit_uri_response_get_mime_type($!wurr);
  }

  method get_status_code {
    webkit_uri_response_get_status_code($!wurr);
  }

  method get_suggested_filename {
    webkit_uri_response_get_suggested_filename($!wurr);
  }

  method get_type {
    webkit_uri_response_get_type();
  }

  method get_uri {
    webkit_uri_response_get_uri($!wurr);
  }

}
