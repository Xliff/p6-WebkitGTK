use v6.c;

use Method::Also;
use NativeCall;


use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebResource;

use WebkitGTK::Roles::Signals::WebResource;

class WebkitGTK::WebResource {
  also does WebkitGTK::Roles::Signals::WebResource;

  has WebKitWebResource $!wr;

  submethod BUILD (:$resource) {
    $!wr = $resource;
  }

  method WebkitGTK::Raw::Definitions::WebKitWebResource
    is also<WebResource>
  { $!wr }

  method new (WebKitWebResource $resource) {
    self.bless(:$resource);
  }

  # Is originally:
  # WebKitWebResource, GError, gpointer --> void
  method failed {
    self.connect-failed($!wr);
  }

  # Is originally:
  # WebKitWebResource, GTlsCertificate, GTlsCertificateFlags, gpointer --> void
  method failed-with-tls-errors is also<failed_with_tls_errors> {
    self.connect-failed-with-tls-errors($!wr);
  }

  # Is originally:
  # WebKitWebResource, gpointer --> void
  method finished {
    self.connect($!wr, 'finished');
  }

  # Is originally:
  # WebKitWebResource, guint64, gpointer --> void
  method received-data is also<received_data> {
    self.connect-long($!wr, 'received-data');
  }

  # Is originally:
  # WebKitWebResource, WebKitURIRequest, WebKitURIResponse, gpointer --> void
  method sent-request is also<sent_request> {
    self.connect-sent-request($!wr);
  }

  proto method get_data (|)
    is also<get-data>
  { * }

  multi method get_data (
    GAsyncReadyCallback $callback,
    gpointer $user_data       = Pointer,
  ) {
    samewith(GCancellable, $callback, $user_data);
  }
  multi method get_data (
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_web_resource_get_data($!wr, $cancellable, $callback, $user_data);
  }

  proto method get_data_finish (|)
    is also<get-data-finish>
  { * }

  # Returns all values by default.
  multi method get_data_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror,
    :$all = True
  ) {
    samewith($result, $, $error, :$all);
  }
  multi method get_data_finish (
    GAsyncResult() $result,
    $length is rw,
    CArray[Pointer[GError]] $error = gerror,
    :$all = False
  ) {
    my gsize $l = 0;

    clear_error;
    my $d = webkit_web_resource_get_data_finish($!wr, $result, $l, $error);
    set_error($error);
    $length = $l;

    return Nil unless $d;
    $all.not ?? $d !! ($d, $length);
  }

  method get_response
    is also<
      get-response
      response
    >
  {
    webkit_web_resource_get_response($!wr);
  }

  method get_type is also<get-typ> {
    state ($n, $t);
    unstable_get_type( self.^name, &webkit_web_resource_get_type, $n, $t );
  }

  method get_uri
    is also<
      get-uri
      uri
    >
  {
    webkit_web_resource_get_uri($!wr);
  }

}
