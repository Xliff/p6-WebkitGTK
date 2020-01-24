use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebsiteDataManager;

use GLib::Roles::Object;
use WebkitGTK::CookieManager;

my @valid-options = <
  base-cache-directory
  base-data-dictionary
  disk-cache-directory
  indexeddb-directory
  is-ephemeral
  local-storage-directory
  offline-application-cache-directory
  websql-directory
>;

class WebkitGTK::WebsiteDataManager {
  also does GLib::Roles::Object;

  has WebKitWebsiteDataManager $!wwdm;

  submethod BUILD (:$manager) {
    self!setObject($!wwdm = $manager);
  }

  method WebkitGTK::Raw::Definitions::WebKitWebsiteDataManager
    is also<
      DataManager
      WebKitWebsiteDataManager
    >
  { $!wwdm }

  multi method new (%dirs) {
    samewith(|%dirs);
  }
  multi method new(*%dirs) {
    constant oacd = 'offline-application-cache-directory';

    for %dirs.keys {
      die "Invalid option '$_' specified!" unless $_ eq @valid-options.any;
    }

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

    $manager ?? self.bless(:$manager) !! Nil;
  }

  multi method clear (
    Int() $types,
    GTimeSpan $timespan,
    &callback,
    gpointer $user_data = gpointer
  ) {
    samewith($types, $timespan, GCancellable, &callback, $user_data);
  }
  multi method clear (
    Int() $types,
    GTimeSpan $timespan,
    GCancellable() $cancellable,
    &callback,
    gpointer $user_data = gpointer
  ) {
    my guint $t = $types;

    webkit_website_data_manager_clear(
      $!wwdm,
      $t,
      $timespan,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method clear_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<clear-finish>
  {
    clear_error;
    my $rc = so webkit_website_data_manager_clear_finish(
      $!wwdm,
      $result,
      $error
    );
    set_error($error);
    $rc;
  }

  multi method fetch (
    Int() $types,
    &callback,
    gpointer $user_data
  ) {
    samewith($types, GCancellable, &callback, $user_data);
  }
  multi method fetch (
    Int() $types,
    GCancellable() $cancellable,
    &callback,
    gpointer $user_data
  ) {
    my guint $t = $types;

    webkit_website_data_manager_fetch(
      $!wwdm,
      $t,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method fetch_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<fetch-finish>
  {
    clear_error;
    my $rc = so webkit_website_data_manager_fetch_finish(
      $!wwdm,
      $result,
      $error
    );
    set_error($error);
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

  method get_cookie_manager (:$raw = False)
    is also<
      get-cookie-manager
      cookie_manager
      cookie-manager
    >
  {
    my $c = webkit_website_data_manager_get_cookie_manager($!wwdm);

    $c ??
      ( $raw ?? $c !! WebkitGTK::CookieManager.new($c) )
      !!
      Nil
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
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_website_data_manager_get_type,
      $n,
      $t
    );
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

  multi method remove (
    Int() $types,
    GList() $website_data,
    &callback,
    gpointer $user_data = gpointer
  ) {
    samewith($types, $website_data, GCancellable, &callback, $user_data);
  }
  multi method remove (
    Int() $types,
    GList() $website_data,
    GCancellable() $cancellable,
    &callback,
    gpointer $user_data = gpointer
  ) {
    my WebKitWebsiteDataTypes $t = $types;

    webkit_website_data_manager_remove(
      $!wwdm,
      $t,
      $website_data,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method remove_finish (
    GAsyncResult() $result,
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
    set_error($error);
    $rc;
  }

}
