use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebResource;

use WebkitGTK::URIResponse;

use GLib::Roles::Object;
use WebkitGTK::Roles::Signals::WebResource;

class WebkitGTK::WebResource {
  also does GLib::Roles::Object;
  also does WebkitGTK::Roles::Signals::WebResource;

  has WebKitWebResource $!wr is implementor;

  submethod BUILD (:$resource) {
    $!wr = $resource;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitWebResource
    is also<WebResource>
  { $!wr }

  method new (WebKitWebResource $resource) {
    $resource ?? self.bless(:$resource) !! Nil;
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
             &callback,
    gpointer $user_data = Pointer,
  ) {
    samewith(GCancellable, &callback, $user_data);
  }
  multi method get_data (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data = Pointer
  ) {
    webkit_web_resource_get_data($!wr, $cancellable, &callback, $user_data);
  }

  proto method get_data_finish (|)
    is also<get-data-finish>
  { * }

  # Length is provided since this may be a region in memory...
  multi method get_data_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error    = gerror,
                            :$str      = True,
                            :$encoding = 'utf8'
  ) {
    samewith($result, $, $error, :all, :$str, :$encoding);
  }
  multi method get_data_finish (
    GAsyncResult()           $result,
                             $length  is rw,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$all            = False,
                            :$str            = True,
                            :$encoding       = 'utf8'
  ) {
    my gsize $l = 0;

    clear_error;
    my $d = webkit_web_resource_get_data_finish($!wr, $result, $l, $error);
    set_error($error);
    $length = $l;
    
    return Nil unless $d;
    $d = Buf.new( $d[^$l] ).decode($encoding) if $str;
    $all.not ?? $d !! ($d, $length)
  }

  method get_response (:$raw = False)
    is also<
      get-response
      response
    >
  {
    my $r = webkit_web_resource_get_response($!wr);

    $r ??
      ( $raw ?? $r !! WebkitGTK::URIResponse.new($r) )
      !!
      Nil;
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
