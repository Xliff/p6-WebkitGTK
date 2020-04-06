use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::URIRequest;

use GLib::Roles::Object;

class WebkitGTK::URIRequest {
  also does GLib::Roles::Object;

  has WebKitURIRequest $!wur is implementor;

  submethod BUILD (:$request) {
    $!wur =  $request;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitURIRequest
    is also<WebKitURIRequest>
  { $!wur }

  multi method new (WebKitURIRequest $request) {
    $request ?? self.bless(:$request) !! Nil;
  }
  multi method new (Str() $u) {
    my $request = webkit_uri_request_new($u);

    $request ?? self.bless(:$request) !! Nil;
  }

  # Returns SoupMessagerHeaders -- Always raw!
  method get_http_headers is also<get-http-headers> {
    webkit_uri_request_get_http_headers($!wur);
  }

  method get_http_method is also<get-http-method> {
    webkit_uri_request_get_http_method($!wur);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_uri_request_get_type, $n, $t );
  }

}
