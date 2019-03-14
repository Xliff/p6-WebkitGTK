use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebResource;

use WebkitGTK::Roles::Signals::WebResource;

class WebkitGTK::WebResource {
  also does WebkitGTK::Roles::Signals::WebResource;

  has WebKitWebResource $!wr;

  submethod BUILD (:$resource) {
    $!wr = $resource;
  }

  method new WebkitGTK::Raw::Types::WebKitWebResource {
    $!wr;
  }

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

  method get_data (
    GCancellable $cancellable,
    GAsyncReadyCallback $callback = Pointer,
    gpointer $user_data = Pointer
  ) 
    is also<get-data> 
  {
    webkit_web_resource_get_data($!wr, $cancellable, $callback, $user_data);
  }

  method get_data_finish (
    GAsyncResult $result,
    gsize $length,
    CArray[Pointer[GError]] $error = gerror
  ) 
    is also<get-data-finish> 
  {
    webkit_web_resource_get_data_finish($!wr, $result, $length, $error);
  }

  method get_response is also<get-response> {
    webkit_web_resource_get_response($!wr);
  }

  method get_typeis also<get-typ> {
    webkit_web_resource_get_type();
  }

  method get_uri is also<get-uri> {
    webkit_web_resource_get_uri($!wr);
  }

}
