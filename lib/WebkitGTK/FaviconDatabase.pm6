use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::FaviconDatabase;
use WebkitGTK::Raw::Types;

use WebkitGTK::Roles::Signals::Generic;

class WebkitGTK::FaviconDatabase {
  also does WebkitGTK::Roles::Signals::Generic;

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
  method favicon-changed {
    self.connect-strstr($!wfd, 'favicon-changed');
  }

  method clear {
    webkit_favicon_database_clear($database);
  }

  method error_quark {
    webkit_favicon_database_error_quark();
  }

  multi method get_favicon(
    Str() $page_uri,
    GAsyncReadyCallback $callback,
    GCancellable $cancellable = Pointer,
    gpointer $user_data = Pointer
  ) {
    samewith($page_uri, $cancellable, $callback, $user_data);
  }
  multi method get_favicon (
    Str() $page_uri,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer;
  ) {
    webkit_favicon_database_get_favicon(
      $!wfd, $page_uri, $cancellable, $callback, $user_data
    );
  }

  method get_favicon_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror;
  ) {
    $ERROR = Nil;
    my $rc = webkit_favicon_database_get_favicon_finish(
      $!wfd, $result, $error
    );
    $EERROR = $error[0] with $error[0];
    $rc;
  }

  method get_favicon_uri (Str() $page_uri) {
    webkit_favicon_database_get_favicon_uri($!wfd, $page_uri);
  }

  method get_type {
    webkit_favicon_database_get_type();
  }

}
