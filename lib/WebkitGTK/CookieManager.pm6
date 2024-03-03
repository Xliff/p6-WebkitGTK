use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::CookieManager;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WebKitCookieManagerAncestry is export of Mu
  where WebKitCookieManager | GObject;

class WebkitGTK::CookieManager {
  also does GLib::Roles::Object;

  has WebKitCookieManager $!wcm is implementor;

  submethod BUILD ( :$webkit-manager ) {
    self.setWebKitCookieManager($webkit-manager) if $webkit-manager
  }

  method setWebKitCookieManager (WebKitCookieManagerAncestry $_) {
    my $to-parent;

    $!wcm = do {
      when WebKitCookieManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitCookieManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GData::Raw::Definitions::WebKitCookieManager
    is also<WebKitCookieManager>
  { $!wcm }

  multi method new (
     $webkit-manager where * ~~ WebKitCookieManagerAncestry,
    :$ref                                                    = True
  ) {
    return unless $webkit-manager;

    my $o = self.bless( :$webkit-manager );
    $o.ref if $ref;
    $o;
  }

  method changed {
    self.connect($!wcm, 'changed');
  }

  proto method add_cookie (|)
    is also<add-cookie>
  { * }

  multi method add_cookie(
    SoupCookie() $cookie,
                 &callback,
    gpointer     $user_data = Pointer
  ) {
    samewith($cookie, GCancellable, &callback, $user_data);
  }
  multi method add_cookie (
    SoupCookie()   $cookie,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data = Pointer
  ) {
    webkit_cookie_manager_add_cookie(
      $!wcm,
      $cookie,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method add_cookie_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror;
  )
    is also<add-cookie-finish>
  {
    clear_error;
    my $rc = webkit_cookie_manager_add_cookie_finish($!wcm, $result, $error);
    set_error($error);
    $rc;
  }

  proto method delete_cookie (|)
    is also<delete-cookie>
  { * }

  multi method delete_cookie(
    SoupCookie() $cookie,
                 &callback,
    gpointer     $user_data = Pointer
  ) {
    samewith($cookie, GCancellable, &callback, $user_data);
  }
  multi method delete_cookie (
    SoupCookie()   $cookie,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data = Pointer
  ) {
    webkit_cookie_manager_delete_cookie(
      $!wcm,
      $cookie,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method delete_cookie_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror;
  )
    is also<delete-cookie-finish>
  {
    clear_error;
    my $rc = webkit_cookie_manager_delete_cookie_finish(
      $!wcm,
      $result,
      $error
    );
    set_error($error);
    $rc;
  }

  proto method get_accept_policy (|)
    is also<get-accept-policy>
  { * }

  multi method get_accept_policy(
             &callback,
    gpointer $user_data = Pointer
  ) {
    samewith(GCancellable, &callback, $user_data);
  }
  multi method get_accept_policy (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data = Pointer
  ) {
    webkit_cookie_manager_get_accept_policy(
      $!wcm,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method get_accept_policy_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror;
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
    Str()    $uri,
             &callback,
    gpointer $user_data = Pointer
  ) {
    samewith($uri, GCancellable, &callback, $user_data);
  }
  multi method get_cookies (
    Str()          $uri,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = Pointer
  ) {
    webkit_cookie_manager_get_cookies(
      $!wcm,
      $uri,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method get_cookies_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<get-cookies-finish>
  {
    clear_error;
    my $rc = webkit_cookie_manager_get_cookies_finish(
      $!wcm,
      $result,
      $error
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

  multi method set_persistent_storage (|)
  { * }

  multi method set_persistent_storage (Str() $filename, :$sqlite is required) {
    samewith($filename, WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE);
  }
  multi method set_persistent_storage (
    Str() $filename,
    Int() $storage   = WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT
  )
    is also<set-persistent-storage>
  {
    my guint $s = $storage;

    webkit_cookie_manager_set_persistent_storage($!wcm, $filename, $s);
  }

}
