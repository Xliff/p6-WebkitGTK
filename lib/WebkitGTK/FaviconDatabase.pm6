use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::FaviconDatabase;
use WebkitGTK::Raw::Types;

use GTK::Roles::Signals::Generic;

class WebkitGTK::FaviconDatabase {
  also does GTK::Roles::Signals::Generic;

  has WebKitFaviconDatabase $!wfd;

  submethod BUILD (:$database) {
    $!wfd = $database;
  }

  method WebkitGTK::Raw::Types::WebKitFaviconDatabase {
    $!wfd;
  }

  method new (WebKitFaviconDatabase $database) {
    self.bless(:$database);
  }

  # Is originally:
  # WebKitFaviconDatabase, gchar, gchar, gpointer --> void
  method favicon-changed is also<favicon_changed> {
    self.connect-strstr($!wfd, 'favicon-changed');
  }

  method clear {
    webkit_favicon_database_clear($!wfd);
  }

  method error_quark is also<error-quark> {
    webkit_favicon_database_error_quark();
  }

  multi method get_favicon(
    Str() $page_uri,
    GAsyncReadyCallback $callback,
    GCancellable $cancellable = Pointer,
    gpointer $user_data = Pointer
  ) 
    is also<get-favicon> 
  {
    samewith($page_uri, $cancellable, $callback, $user_data);
  }
  multi method get_favicon (
    Str() $page_uri,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer;
  ) 
    is also<get-favicon> 
  {
    webkit_favicon_database_get_favicon(
      $!wfd, $page_uri, $cancellable, $callback, $user_data
    );
  }

  method get_favicon_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror;
  ) 
    is also<get-favicon-finish> 
  {
    $ERROR = Nil;
    my $rc = webkit_favicon_database_get_favicon_finish(
      $!wfd, $result, $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  method get_favicon_uri (Str() $page_uri) is also<get-favicon-uri> {
    webkit_favicon_database_get_favicon_uri($!wfd, $page_uri);
  }

  method get_type is also<get-type> {
    webkit_favicon_database_get_type();
  }

}
