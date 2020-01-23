use v6.c;

use Method::Also;
use NativeCall;


use WebkitGTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::CookieManager;

use GLib::Roles::Object;

use GTK::Roles::Types;
use GLib::Roles::Signals::Generic;

class WebkitGTK::CookieManager {
  also does GLib::Roles::Object;

  also does GTK::Roles::Types;
  also does GLib::Roles::Signals::Generic;

  has WebKitCookieManager $!wcm;

  submethod BUILD (:$manager) {
    $!wcm = $manager;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitCookieManager
    is also<WebKitCookieManager>
  { $!wcm }

  method new (WebKitCookieManager $manager) {
    self.bless(:$manager);
  }

  method changed {
    self.connect($!wcm, 'changed');
  }

  proto method add_cookie (|)
    is also<add-cookie>
  { * }

  multi method add_cookie(
    SoupCookie $cookie,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith($cookie, GCancellable, $callback, $user_data);
  }
  multi method add_cookie (
    SoupCookie $cookie,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_cookie_manager_add_cookie(
      $!wcm, $cookie, $cancellable, $callback, $user_data
    );
  }

  method add_cookie_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror;
  )
    is also<add-cookie-finish>
  {
    clear_error;
    my $rc = webkit_cookie_manager_add_cookie_finish(
      $!wcm, $result, $error
    );
    set_error($error);
    $rc;
  }

  proto method delete_cookie (|)
    is also<delete-cookie>
  { * }

  multi method delete_cookie(
    SoupCookie $cookie,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith($cookie, GCancellable, $callback, $user_data);
  }
  multi method delete_cookie (
    SoupCookie $cookie,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_cookie_manager_delete_cookie(
      $!wcm, $cookie, $cancellable, $callback, $user_data
    );
  }

  method delete_cookie_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror;
  )
    is also<delete-cookie-finish>
  {
    clear_error;
    my $rc = webkit_cookie_manager_delete_cookie_finish(
      $!wcm, $result, $error
    );
    set_error($error);
    $rc;
  }

  proto method get_accept_policy (|)
    is also<get-accept-policy>
  { * }

  multi method get_accept_policy(
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith(GCancellable, $callback, $user_data);
  }
  multi method get_accept_policy (
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_cookie_manager_get_accept_policy(
      $!wcm, $cancellable, $callback, $user_data
    );
  }

  method get_accept_policy_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror;
  )
    is also<
      get-accept-policy-finish
      accept_policy_finish
      accept-policy-finish
    >
  {
    clear_error;
    my $rc = webkit_cookie_manager_get_accept_policy_finish(
      $!wcm, $result, $error
    );
    set_error($error);
    $rc;
  }

  proto method get_cookies (|)
    is also<get-cookies>
  { * }

  multi method get_cookies (
    Str() $uri,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith($uri, GCancellable, $callback, $user_data);
  }
  multi method get_cookies (
    Str() $uri,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_cookie_manager_get_cookies(
      $!wcm, $uri, $cancellable, $callback, $user_data
    );
  }

  method get_cookies_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<get-cookies-finish>
  {
    clear_error;
    my $rc = webkit_cookie_manager_get_cookies_finish(
      $!wcm, $result, $error
    );
    set_error($error);
    $rc;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_cookie_manager_get_type, $n, $t );
  }

  method set_accept_policy (Int() $policy) is also<set-accept-policy> {
    my guint $p = $policy;

    webkit_cookie_manager_set_accept_policy($!wcm, $p);
  }

  method set_persistent_storage (
    Str() $filename,
    Int() $storage                # WebKitCookiePersistentStorage $storage
  )
    is also<set-persistent-storage>
  {
    my guint $s = $storage;

    webkit_cookie_manager_set_persistent_storage($!wcm, $filename, $s);
  }

}
