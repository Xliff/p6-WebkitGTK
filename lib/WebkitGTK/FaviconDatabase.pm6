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

  method WebkitGTK::Raw::Types::WebKitFaviconDatabase
    is also<FaviconDatabase>
  { $!wfd }

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

  proto method get_favicon (|)
    is also<get-favicon>
  { * }

  multi method get_favicon(
    Str() $page_uri,
    GAsyncReadyCallback $callback,
    gpointer $user_data       = Pointer,
  ) {
    samewith($page_uri, GCancellable, $callback, $user_data);
  }
  multi method get_favicon (
    Str() $page_uri,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_favicon_database_get_favicon(
      $!wfd, $page_uri, $cancellable, $callback, $user_data
    );
  }

  method get_favicon_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror()
  )
    is also<get-favicon-finish>
  {
    clear_error;
    my $rc = webkit_favicon_database_get_favicon_finish(
      $!wfd, $result, $error
    );
    set_error($error);
    $rc;
  }

  method get_favicon_uri (Str() $page_uri) is also<get-favicon-uri> {
    webkit_favicon_database_get_favicon_uri($!wfd, $page_uri);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_favicon_database_get_type, $n, $t );
  }

}
