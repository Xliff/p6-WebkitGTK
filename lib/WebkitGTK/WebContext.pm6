use v6.c;

use Method::Also;

use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebContext;

use WebkitGTK::CookieManager;
use WebkitGTK::FaviconDatabase;
use WebkitGTK::Plugin;
use WebkitGTK::SecurityManager;
use WebkitGTK::WebsiteDataManager;

use GLib::Roles::Object;
use WebkitGTK::Roles::Signals::WebContext;

class WebkitGTK::WebContext {
  also does GLib::Roles::Object;
  also does WebkitGTK::Roles::Signals::WebContext;

  has WebKitWebContext $!wwc is implementor;

  submethod BUILD(:$context) {
    $!wwc = $context;

    self.roleInit-Object;
    #self.ADD-PREFIX('WebkitGTK::');
  }

  method WebkitGTK::Raw::Definitions::WebKitWebContext
    is also<WebKitWebContext>
  { $!wwc }

  # No attempt at GC, so no need for reference count manip
  multi method new (WebKitWebContext $context) {
    $context ?? self.bless(:$context) !! Nil;
  }
  multi method new {
    my $context = webkit_web_context_new();

    $context ?? self.bless(:$context) !! Nil;
  }

  method new_ephemeral is also<new-ephemeral> {
    my $context = webkit_web_context_new_ephemeral();

    $context ?? self.bless(:$context) !! Nil;
  }

  method new_with_website_data_manager(WebKitWebsiteDataManager() $data)
    is also<new-with-website-data-manager>
  {
    my $context = webkit_web_context_new_with_website_data_manager($data);

    $context ?? self.bless(:$context) !! Nil;
  }

  method get_default is also<get-default> {
    my $context = webkit_web_context_get_default();

    $context ?? self.bless(:$context) !! Nil;
  }

  # Is originally:
  # WebKitWebContext, WebKitAutomationSession, gpointer --> void
  method automation-started is also<automation_started> {
    self.connect-automation-started($!wwc);
  }

  # Is originally:
  # WebKitWebContext, WebKitDownload, gpointer --> void
  method download-started is also<download_started> {
    self.connect-download-started($!wwc);
  }

  # Is originally:
  # WebKitWebContext, gpointer --> void
  method initialize-notification-permissions
    is also<initialize_notification_permissions>
  {
    self.connect($!wwc, 'initialize-notification-permissions');
  }

  # Is originally:
  # WebKitWebContext, gpointer --> void
  method initialize-web-extensions is also<initialize_web_extensions> {
    self.connect($!wwc, 'initialize-web-extensions');
  }

  method cache_model is rw is also<cache-model> {
    Proxy.new(
      FETCH => sub ($) {
        WebKitCacheModelEnum( webkit_web_context_get_cache_model($!wwc) )
      },
      STORE => sub ($, Int() $cache_model is copy) {
        my guint $cm = $cache_model;

        webkit_web_context_set_cache_model($!wwc, $cm);
      }
    );
  }

  method favicon_database_directory is rw is also<favicon-database-directory> {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_favicon_database_directory($!wwc);
      },
      STORE => sub ($, Str() $path is copy) {
        webkit_web_context_set_favicon_database_directory($!wwc, $path);
      }
    );
  }

  method process_model is rw is also<process-model> {
    Proxy.new(
      FETCH => sub ($) {
        WebKitProcessModelEnum( webkit_web_context_get_process_model($!wwc) );
      },
      STORE => sub ($, Int() $process_model is copy) {
        my guint $pm = $process_model;

        webkit_web_context_set_process_model($!wwc, $pm);
      }
    );
  }

  method spell_checking_enabled is rw is also<spell-checking-enabled> {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_spell_checking_enabled($!wwc);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my guint $e = $enabled;

        webkit_web_context_set_spell_checking_enabled($!wwc, $e);
      }
    );
  }

  method tls_errors_policy is rw is also<tls-errors-policy> {
    Proxy.new(
      FETCH => sub ($) {
        WebKitTLSErrorsPolicyEnum(
          webkit_web_context_get_tls_errors_policy($!wwc)
        );
      },
      STORE => sub ($, Int() $policy is copy) {
        my guint $p = $policy;

        webkit_web_context_set_tls_errors_policy($!wwc, $p);
      }
    );
  }

  method web_process_count_limit is rw is also<web-process-count-limit> {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_web_process_count_limit($!wwc);
      },
      STORE => sub ($, Int() $limit is copy) {
        my guint $l = $limit;

        webkit_web_context_set_web_process_count_limit($!wwc, $l);
      }
    );
  }

  method spell_checking_languages is rw is also<spell-checking-languages> {
    Proxy.new(
      FETCH => sub ($) {
        my $l = webkit_web_context_get_spell_checking_languages($!wwc);

        CStringArrayToArray($l);
      },
      STORE => -> $, Str @langs {
        webkit_web_context_set_spell_checking_languages(
          $!wwc,
          resolve-gstrv(@langs)
        );
      }
    );
  }

  method allow_tls_certificate_for_host (
    GTlsCertificate() $certificate,
    Str() $host
  )
    is also<allow-tls-certificate-for-host>
  {
    webkit_web_context_allow_tls_certificate_for_host(
      $!wwc, $certificate, $host
    );
  }

  method clear_cache is also<clear-cache> {
    webkit_web_context_clear_cache($!wwc);
  }

  method download_uri (Str() $uri) is also<download-uri> {
    webkit_web_context_download_uri($!wwc, $uri);
  }

  method get_cookie_manager (:$raw = False) is also<get-cookie-manager> {
    my $cm = webkit_web_context_get_cookie_manager($!wwc);

    $cm ??
      ( $raw ?? $cm !! WebkitGTK::CookieManager.new($cm) )
      !!
      Nil;
  }

  method get_favicon_database (:$raw = False) is also<get-favicon-database> {
    my $f = webkit_web_context_get_favicon_database($!wwc);

    $f ??
      ( $raw ?? $f !! WebkitGTK::FaviconDatabase.new($f) )
      !!
      Nil;
  }

  proto method get_plugins (|)
    is also<get-plugins>
  { * }

  multi method get_plugins (
    &callback,
    gpointer $user_data = gpointer
  ) {
    samewith(GCancellable, &callback, $user_data);
  }
  multi method get_plugins (
    GCancellable() $cancellable,
    &callback,
    gpointer $user_data = gpointer
  ) {
    webkit_web_context_get_plugins(
      $!wwc,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method get_plugins_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror,
    :$glist = False,
    :$raw = False;
  )
    is also<get-plugins-finish>
  {
    clear_error;
    my $pl = webkit_web_context_get_plugins_finish($!wwc, $result, $error);
    set_error($error);

    return Nil unless $pl;
    return $pl if $glist;

    $pl = GLib::GList.new($pl) but GLib::Roles::ListData[WebKitPlugin];
    $raw ?? $pl.Array !! $pl.Array.map({ WebkitGTK::Plugin.new($_) });
  }

  method get_security_manager (:$raw = False) is also<get-security-manager> {
    my $sm = webkit_web_context_get_security_manager($!wwc);

    $sm ??
      ( $raw ?? $sm !! WebkitGTK::SecurityManager.new($sm) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_web_context_get_type, $n, $t );
  }

  method get_website_data_manager (:$raw = False)
    is also<get-website-data-manager>
  {
    my $dm = webkit_web_context_get_website_data_manager($!wwc);

    $dm ??
      ( $raw ?? $dm !! WebkitGTK::WebsiteDataManager.new($dm) )
      !!
      Nil;
  }

  method perform_initialize_notification_permissions (
    GList() $allowed_origins,
    GList() $disallowed_origins
  )
    is also<perform-initialize-notification-permissions>
  {
    webkit_web_context_initialize_notification_permissions(
      $!wwc, $allowed_origins, $disallowed_origins
    );
  }

  method is_automation_allowed is also<is-automation-allowed> {
    so webkit_web_context_is_automation_allowed($!wwc);
  }

  method is_ephemeral is also<is-ephemeral> {
    so webkit_web_context_is_ephemeral($!wwc);
  }

  method prefetch_dns (Str() $hostname) is also<prefetch-dns> {
    webkit_web_context_prefetch_dns($!wwc, $hostname);
  }

  method register_uri_scheme (
    Str() $scheme,
    &callback,
    gpointer $user_data = Pointer,
    GDestroyNotify $user_data_destroy_func = GDestroyNotify
  )
    is also<register-uri-scheme>
  {
    webkit_web_context_register_uri_scheme(
      $!wwc,
      $scheme,
      &callback,
      $user_data,
      $user_data_destroy_func
    );
  }

  method set_additional_plugins_directory (Str() $directory)
    is also<set-additional-plugins-directory>
  {
    webkit_web_context_set_additional_plugins_directory($!wwc, $directory);
  }

  method set_automation_allowed (Int() $allowed)
    is also<set-automation-allowed>
  {
    my guint $a = $allowed;

    webkit_web_context_set_automation_allowed($!wwc, $a);
  }

  method set_network_proxy_settings (
    Int() $proxy_mode,            # WebKitNetworkProxyMode $proxy_mode,
    WebKitNetworkProxySettings() $proxy_settings
  )
    is also<set-network-proxy-settings>
  {
    my guint $pm = $proxy_mode;

    webkit_web_context_set_network_proxy_settings(
      $!wwc,
      $pm,
      $proxy_settings
    );
  }

  method set_web_extensions_directory (Str() $directory)
    is also<set-web-extensions-directory>
  {
    webkit_web_context_set_web_extensions_directory($!wwc, $directory);
  }

  method set_web_extensions_initialization_user_data (GVariant() $user_data)
    is also<set-web-extensions-initialization-user-data>
  {
    webkit_web_context_set_web_extensions_initialization_user_data(
      $!wwc,
      $user_data
    );
  }

  method set_preferred_languages (Str @languages)
    is also<set-preferred-languages>
  {
    webkit_web_context_set_preferred_languages(
      $!wwc,
      resolve-gstrv(@languages)
    );
  }

}
