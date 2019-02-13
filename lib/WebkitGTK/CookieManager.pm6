use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::CookieManager;

use GTK::Roles::Types;
use GTK::Roles::Signals::Generic;

class WebkitGTK::CookieManager {
  also does GTK::Roles::Types;
  also does GTK::Roles::Signals::Generic;

  has WebKitCookieManager $!wcm;

  submethod BUILD (:$manager) {
    $!wcm = $manager;
  }

  method changed {
    self.connect($!wcm, 'changed');
  }

  method new (WebKitCookieManager $manager) {
    self.bless(:$manager);
  }

  multi method add_cookie(
    SoupCookie $cookie,
    GAsyncReadyCallback $callback,
    GCancellable $cancellable = Pointer,
    gpointer $user_data = Pointer
  ) {
    samewith($cookie, $cancellable, $callback, $user_data);
  }
  multi method add_cookie (
    SoupCookie $cookie,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_cookie_manager_add_cookie(
      $!wcm, $cookie, $cancellable, $callback, $user_data
    );
  }

  method add_cookie_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror;
  ) {
    $ERROR = Nil;
    my $rc = webkit_cookie_manager_add_cookie_finish(
      $!wcm, $result, $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  multi method delete_cookie(
    SoupCookie $cookie,
    GAsyncReadyCallback $callback,
    GCancellable $cancellable = Pointer,
    gpointer $user_data = Pointer
  ) {
    samewith($cookie, $cancellable, $callback, $user_data);
  }
  multi method delete_cookie (
    SoupCookie $cookie,
    GCancellable $cancellable,
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
  ) {
    $ERROR = Nil;
    my $rc = webkit_cookie_manager_delete_cookie_finish(
      $!wcm, $result, $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  multi method get_accept_policy(
    GAsyncReadyCallback $callback,
    GCancellable $cancellable = Pointer,
    gpointer $user_data = Pointer
  ) {
    samewith($cancellable, $callback, $user_data);
  }
  multi method get_accept_policy (
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_cookie_manager_get_accept_policy(
      $!wcm, $cancellable, $callback, $user_data
    );
  }

  method get_accept_policy_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror;
  ) {
    $ERROR = Nil;
    my $rc = webkit_cookie_manager_get_accept_policy_finish(
      $!wcm, $result, $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  multi method get_cookies (
    Str() $uri,
    GAsyncReadyCallback $callback,
    GCancellable $cancellable = Pointer,
    gpointer $user_data = Pointer
  ) {
    samewith($uri, $cancellable, $callback, $user_data);
  }
  multi method get_cookies (
    Str() $uri,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_cookie_manager_get_cookies(
      $!wcm, $uri, $cancellable, $callback, $user_data
    );
  }

  method get_cookies_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    my $rc = webkit_cookie_manager_get_cookies_finish(
      $!wcm, $result, $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  method get_type {
    webkit_cookie_manager_get_type();
  }

  method set_accept_policy (Int() $policy) {
    my guint $p = self.RESOLVE-UINT($policy);
    webkit_cookie_manager_set_accept_policy($!wcm, $p);
  }

  method set_persistent_storage (
    Str() $filename,
    Int() $storage                # WebKitCookiePersistentStorage $storage
  ) {
    my guint $s = self.RESOLVE-UINT($storage);
    webkit_cookie_manager_set_persistent_storage($!wcm, $filename, $s);
  }

}
