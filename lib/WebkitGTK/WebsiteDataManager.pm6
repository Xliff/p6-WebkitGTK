use v6.c;

use Method::Also;
use NativeCall;


use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::WebsiteDataManager;

use GLib::Roles::Object;

use GTK::Roles::Types;

use WebkitGTK::CookieManager;

class WebkitGTK::WebsiteDataManager {
  also does GLib::Roles::Object;
  
  also does GTK::Roles::Types;

  has WebKitWebsiteDataManager $!wwdm;

  submethod BUILD (:$manager) {
    self!setObject($!wwdm = $manager);
  }

  method WebkitGTK::Raw::Definitions::WebKitWebsiteDataManager 
    is also<DataManager>
  { $!wwdm }

  method new(%dirs) {
    constant oacd = 'offline-application-cache-directory';

    # Now THIS is utterly obnoxious. Where's the StrV version?
    my $manager = webkit_website_data_manager_new(
      'base-cache-directory',    %dirs<base-cache-directory>    // '',
      'base-data-dictionary',    %dirs<base-data-dictionary>    // '',
      'disk-cache-directory',    %dirs<disk-cache-directory>    // '',
      'indexeddb-directory',     %dirs<indexeddb-directory>     // '',
      'is-ephemeral',            %dirs<is-ephemeral>            //  0,
      'local-storage-directory', %dirs<local-storage-directory> // '',
      oacd,                      %dirs{oacd}                    // '',
      'websql-directory',        %dirs<websql-directory>        // '',
       Str
    );
    self.bless($manager);
  }

  method new_ephemeral is also<new-ephemeral> {
    my $manager = webkit_website_data_manager_new_ephemeral();
    self.bless(:$manager);
  }

  method clear (
    Int() $types,
    GTimeSpan $timespan,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    my guint $t = self.RESOLVE-UINT($types);
    webkit_website_data_manager_clear(
      $!wwdm, $t, $timespan, $cancellable, $callback, $user_data
    );
  }

  method clear_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) 
    is also<clear-finish> 
  {
    clear_error;
    my $rc = webkit_website_data_manager_clear_finish(
      $!wwdm, 
      $result, 
      $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  method fetch (
    Int() $types,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    my guint $t = self.RESOLVE-UINT($types);
    webkit_website_data_manager_fetch(
      $!wwdm, $t, $cancellable, $callback, $user_data
    );
  }

  method fetch_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) is also<fetch-finish> {
    clear_error;
    my $rc = so webkit_website_data_manager_fetch_finish(
      $!wwdm, 
      $result, 
      $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

  method get_base_cache_directory 
    is also<
      get-base-cache-directory
      base_cache_directory
      base-cache-directory
    > 
  {
    webkit_website_data_manager_get_base_cache_directory($!wwdm);
  }

  method get_base_data_directory 
    is also<
      get-base-data-directory
      base_data_directory
      base-data-directory
    > 
  {
     webkit_website_data_manager_get_base_data_directory($!wwdm)
  }

  method get_cookie_manager 
    is also<
      get-cookie-manager
      cookie_manager
      cookie-manager
    > 
  {
    WebkitGTK::CookieManager.new(
      webkit_website_data_manager_get_cookie_manager($!wwdm)
    );
  }

  method get_disk_cache_directory 
    is also<
      get-disk-cache-directory
      disk_cache_directory
      disk-cache-directory
    > 
  {
    webkit_website_data_manager_get_disk_cache_directory($!wwdm);
  }

  method get_indexeddb_directory 
    is also<
      get-indexeddb-directory
      indexeddb_directory
      indexeddb-directory
      indexed_db_directory
      indexed-db-directory
    > 
  {
    webkit_website_data_manager_get_indexeddb_directory($!wwdm);
  }

  method get_local_storage_directory 
    is also<
      get-local-storage-directory
      local_storage_directory
      local-storage-directory
    > 
  {
    webkit_website_data_manager_get_local_storage_directory($!wwdm);
  }

  method get_offline_application_cache_directory 
    is also<
      get-offline-application-cache-directory
      offline_application_cache_directory
      offline-application-cache-directory
    > 
  {
    webkit_website_data_manager_get_offline_application_cache_directory(
      $!wwdm
    );
  }

  method get_type is also<get-type> {
    webkit_website_data_manager_get_type();
  }

  method get_websql_directory 
    is also<
      get-websql-directory
      websql_directory
      websql-directory
    > 
  {
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
  ) 
    is also<remove-finish> 
  {
    clear_error;
    my $rc = so webkit_website_data_manager_remove_finish(
      $!wwdm, 
      $result, 
      $error
    );
    $ERROR = $error[0] with $error[0];
    $rc;
  }

}
