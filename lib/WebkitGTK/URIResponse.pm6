use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::URIResponse;

use GLib::Roles::Object;

class WebkitGTK::URIResponse {
  also does GLib::Roles::Object; 
  
  has WebKitURIResponse $!wurr;

  submethod BLESS(:$response) {
    self!setObject($!wurr = $response);
  }

  method WebkitGTK::Raw::Types::WebKitURIResponse 
    is also<URIResponse>
  { $!wurr }

  method get_content_length is also<
    get-content-length
    content_length
    content-length
  > {
    webkit_uri_response_get_content_length($!wurr);
  }

  method get_http_headers is also<
    get-http-headers
    http_headers
    http-headers
  > {
    webkit_uri_response_get_http_headers($!wurr);
  }

  method get_mime_type is also<
    get-mime-type
    mime_type
    mime-type
  > {
    webkit_uri_response_get_mime_type($!wurr);
  }

  method get_status_code is also<
    get-status-code
    status_code
    status-code
  > {
    webkit_uri_response_get_status_code($!wurr);
  }

  method get_suggested_filename is also<
    get-suggested-filename
    suggested_filename
    suggested-filename
  > {
    webkit_uri_response_get_suggested_filename($!wurr);
  }

  method get_type is also<get-type> {
    webkit_uri_response_get_type();
  }

  method get_uri is also<
    get-uri
    uri
  > {
    webkit_uri_response_get_uri($!wurr);
  }

}
