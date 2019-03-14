use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::WebsiteDataManager;

use GTK::Roles::Types;

class WebkitGTK::WebsiteDataManager {
  also does GTK::Roles::Types;

  has WebKitWebsiteDataManager $!wwdm;

  submethod BUILD (:$manager) {
    $!wwdm = $manager;
  }

  method WebkitGTK::Raw::Types::WebKitWebsiteDataManager {
    $!wwdm;
  }

  method new(%dirs) {
    constant oacd = 'offline-application-cache-directory';

    # Now THIS is utterly obnoxious. Where's the StrV version?
    my $manager = webkit_website_data_manager_new(
      'base-cache-directory', %dirs<base-cache-directory>    // '',
      'base-data-dictionary', %dirs<base-data-dictionary>    // '',
      'disk-cache-directory', %dirs<disk-cache-directory>    // '',
       'indexeddb-directory', %dirs<indexeddb-directory>     // '',
              'is-ephemeral', %dirs<is-ephemeral>            //  0,
   'local-storage-directory', %dirs<local-storage-directory> // '',
                        oacd, %dirs{oacd}                    // '',
          'websql-directory', %dirs<websql-directory>        // '',
      Str
    );
    self.bless($manager);
  }


  method new_ephemeral is also<new-ephemeral> {
    my $manager = webkit_website_data_manager_new_ephemeral();
    self.bless(:$manager);
  }

  method clear (
    WebKitWebsiteDataTypes $types,
    GTimeSpan $timespan,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    webkit_website_data_manager_clear(
      $!wwdm, $types, $timespan, $cancellable, $callback, $user_data
    );
  }

  method clear_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) is also<clear-finish> {
    webkit_website_data_manager_clear_finish($!wwdm, $result, $error);
  }

  method fetch (
    WebKitWebsiteDataTypes $types,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    webkit_website_data_manager_fetch(
      $!wwdm, $types, $cancellable, $callback, $user_data
    );
  }

  method fetch_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) is also<fetch-finish> {
    so webkit_website_data_manager_fetch_finish($!wwdm, $result, $error);
  }

  method get_base_cache_directory is also<get-base-cache-directory> {
    webkit_website_data_manager_get_base_cache_directory($!wwdm);
  }

  method get_base_data_directory is also<get-base-data-directory> {
    webkit_website_data_manager_get_base_data_directory($!wwdm);
  }

  method get_cookie_manager is also<get-cookie-manager> {
    webkit_website_data_manager_get_cookie_manager($!wwdm);
  }

  method get_disk_cache_directory is also<get-disk-cache-directory> {
    webkit_website_data_manager_get_disk_cache_directory($!wwdm);
  }

  method get_indexeddb_directory is also<get-indexeddb-directory> {
    webkit_website_data_manager_get_indexeddb_directory($!wwdm);
  }

  method get_local_storage_directory is also<get-local-storage-directory> {
    webkit_website_data_manager_get_local_storage_directory($!wwdm);
  }

  method get_offline_application_cache_directory is also<get-offline-application-cache-directory> {
    webkit_website_data_manager_get_offline_application_cache_directory(
      $!wwdm
    );
  }

  method get_type is also<get-type> {
    webkit_website_data_manager_get_type();
  }

  method get_websql_directory is also<get-websql-directory> {
    webkit_website_data_manager_get_websql_directory($!wwdm);
  }

  method is_ephemeral is also<is-ephemeral> {
    so webkit_website_data_manager_is_ephemeral($!wwdm);
  }

  method remove (
    WebKitWebsiteDataTypes $types,
    GList $website_data,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    webkit_website_data_manager_remove(
      $!wwdm, $types, $website_data, $cancellable, $callback, $user_data
    );
  }

  method remove_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) is also<remove-finish> {
    so webkit_website_data_manager_remove_finish($!wwdm, $result, $error);
  }

}

