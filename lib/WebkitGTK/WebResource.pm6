use v6.c;

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
  method failed-with-tls-errors {
    self.connect-failed-with-tls-errors($!wr);
  }

  # Is originally:
  # WebKitWebResource, gpointer --> void
  method finished {
    self.connect($!wr, 'finished');
  }

  # Is originally:
  # WebKitWebResource, guint64, gpointer --> void
  method received-data {
    self.connect-long($!wr, 'received-data');
  }

  # Is originally:
  # WebKitWebResource, WebKitURIRequest, WebKitURIResponse, gpointer --> void
  method sent-request {
    self.connect-sent-request($!wr);
  }

  method get_data (
    GCancellable $cancellable,
    GAsyncReadyCallback $callback = Pointer,
    gpointer $user_data = Pointer
  ) {
    webkit_web_resource_get_data($!wr, $cancellable, $callback, $user_data);
  }

  method get_data_finish (
    GAsyncResult $result,
    gsize $length,
    CArray[Pointer[GError]] $error = gerror
  ) {
    webkit_web_resource_get_data_finish($!wr, $result, $length, $error);
  }

  method get_response {
    webkit_web_resource_get_response($!wr);
  }

  method get_type{
    webkit_web_resource_get_type();
  }

  method get_uri {
    webkit_web_resource_get_uri($!wr);
  }

}
