use v6.c;

use NativeCall;



use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WebsiteDataManager;

# I veel Keeell....
sub webkit_website_data_manager_new(
  Str, Str,
  Str, Str,
  Str, Str,
  Str, Str,
  Str, guint,
  Str, Str,
  Str, Str,
  Str, Str,
  Str
)
  returns WebKitWebsiteDataManager
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_clear (
  WebKitWebsiteDataManager $manager,
  guint $types,                   # WebKitWebsiteDataTypes $types,
  GTimeSpan $timespan,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_clear_finish (
  WebKitWebsiteDataManager $manager,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_fetch (
  WebKitWebsiteDataManager $manager,
  guint $types,                   # WebKitWebsiteDataTypes $types,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_fetch_finish (
  WebKitWebsiteDataManager $manager,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_base_cache_directory (
  WebKitWebsiteDataManager $manager
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_base_data_directory (
  WebKitWebsiteDataManager $manager
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_cookie_manager (
  WebKitWebsiteDataManager $manager
)
  returns WebKitCookieManager
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_disk_cache_directory (
  WebKitWebsiteDataManager $manager
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_indexeddb_directory (
  WebKitWebsiteDataManager $manager
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_local_storage_directory (
  WebKitWebsiteDataManager $manager
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_offline_application_cache_directory (
  WebKitWebsiteDataManager $manager
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_get_websql_directory (
  WebKitWebsiteDataManager $manager
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_is_ephemeral (
  WebKitWebsiteDataManager $manager
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_new_ephemeral ()
  returns WebKitWebsiteDataManager
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_remove (
  WebKitWebsiteDataManager $manager,
  guint $types,                   # WebKitWebsiteDataTypes $types,
  GList $website_data,
  GCancellable $cancellable,
  &callback (GObject, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_website_data_manager_remove_finish (
  WebKitWebsiteDataManager $manager,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(webkit)
  is export
  { * }
