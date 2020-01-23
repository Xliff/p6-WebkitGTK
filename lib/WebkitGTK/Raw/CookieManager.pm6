use v6.c;

use NativeCall;


use WebkitGTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::CookieManager;

sub webkit_cookie_manager_add_cookie (
  WebKitCookieManager $cookie_manager,
  SoupCookie $cookie,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_add_cookie_finish (
  WebKitCookieManager $cookie_manager,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_delete_cookie (
  WebKitCookieManager $cookie_manager,
  SoupCookie $cookie,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_delete_cookie_finish (
  WebKitCookieManager $cookie_manager,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_get_accept_policy (
  WebKitCookieManager $cookie_manager,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_get_accept_policy_finish (
  WebKitCookieManager $cookie_manager,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32 # WebKitCookieAcceptPolicy
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_get_cookies (
  WebKitCookieManager $cookie_manager,
  Str $uri,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_get_cookies_finish (
  WebKitCookieManager $cookie_manager,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_set_accept_policy (
  WebKitCookieManager $cookie_manager,
  uint32 $policy                  # WebKitCookieAcceptPolicy $policy
)
  is native(webkit)
  is export
  { * }

sub webkit_cookie_manager_set_persistent_storage (
  WebKitCookieManager $cookie_manager,
  Str $filename,
  uint32 $storage                 # WebKitCookiePersistentStorage $storage
)
  is native(webkit)
  is export
  { * }
