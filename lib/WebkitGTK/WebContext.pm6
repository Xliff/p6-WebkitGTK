use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Compat::Types;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebContext;

use GTK::Roles::Types;
use WebkitGTK::Roles::Signals::WebContext;

class WebkitGTK::WebContext {
  also does GTK::Roles::Types;
  also does WebkitGTK::Roles::Signals::WebContext;

  has WebKitWebContext $!wwc;

  submethod BUILD(:$context) {
    $!wwc = $context;
  }

  method new {
    self.bless( context => webkit_web_context_new() );
  }

  method new_ephemeral {
    self.bless( context => webkit_web_context_new_ephemeral() );
  }

  method new_with_website_data_manager(WebKitWebsiteDataManager() $data) {
    my $context = webkit_web_context_new_with_website_data_manager($data);
    self.bless(:$context);
  }

  method get_default {
    self.bless( context => webkit_web_context_get_default() );
  }

  # Is originally:
  # WebKitWebContext, WebKitAutomationSession, gpointer --> void
  method automation-started {
    self.connect-automation-started($!wwc);
  }

  # Is originally:
  # WebKitWebContext, WebKitDownload, gpointer --> void
  method download-started {
    self.connect-download-started($!wwc);
  }

  # Is originally:
  # WebKitWebContext, gpointer --> void
  method initialize-notification-permissions {
    self.connect($!wwc, 'initialize-notification-permissions');
  }

  # Is originally:
  # WebKitWebContext, gpointer --> void
  method initialize-web-extensions {
    self.connect($!wwc, 'initialize-web-extensions');
  }

  method cache_model is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_cache_model($!wwc);
      },
      STORE => sub ($, Int() $cache_model is copy) {
        my guint $cm = self.RESOLVE-UINT($cache_model);
        webkit_web_context_set_cache_model($!wwc, $cm);
      }
    );
  }

  method favicon_database_directory is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_favicon_database_directory($!wwc);
      },
      STORE => sub ($, Str() $path is copy) {
        webkit_web_context_set_favicon_database_directory($!wwc, $path);
      }
    );
  }

  method process_model is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_process_model($!wwc);
      },
      STORE => sub ($, Int() $process_model is copy) {
        my guint $pm = self.RESOLVE-UINT($process_model);
        webkit_web_context_set_process_model($!wwc, $pm);
      }
    );
  }

  method spell_checking_enabled is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_spell_checking_enabled($!wwc);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my guint $e = self.RESOLVE-BOOL($enabled);
        webkit_web_context_set_spell_checking_enabled($!wwc, $e);
      }
    );
  }

  method tls_errors_policy is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_tls_errors_policy($!wwc);
      },
      STORE => sub ($, Int() $policy is copy) {
        my guint $p = self.RESOLVE-UINT($policy);
        webkit_web_context_set_tls_errors_policy($!wwc, $p);
      }
    );
  }

  method web_process_count_limit is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_context_get_web_process_count_limit($!wwc);
      },
      STORE => sub ($, $limit is copy) {
        webkit_web_context_set_web_process_count_limit($!wwc, $limit);
      }
    );
  }

  method spell_checking_languages is rw {
    Proxy.new(
      FETCH => -> $ {
        my $l = webkit_web_context_get_spell_checking_languages($!wwc);
        my $ret;
        with $l {
          my $i = 0;
          while $l[$i].defined { $ret[$i] = $l[$i++] }
        }
        $ret;
      },
      STORE => $, Str @langs {
        my $l = CArray[Str].new;
        for ^@langs.elems {
          $l[$_] = @langs[$_];
          LAST { $l[$_ + 1] = Str }
        }
        webkit_web_context_set_spell_checking_languages($!wwc, $l);
      }
    );
  }

  method allow_tls_certificate_for_host (
    GTlsCertificate $certificate,
    Str() $host
  ) {
    webkit_web_context_allow_tls_certificate_for_host(
      $!wwc, $certificate, $host
    );
  }

  method clear_cache {
    webkit_web_context_clear_cache($!wwc);
  }

  method download_uri (Str() $uri) {
    webkit_web_context_download_uri($!wwc, $uri);
  }

  method get_cookie_manager {
    webkit_web_context_get_cookie_manager($!wwc);
  }

  method get_favicon_database {
    webkit_web_context_get_favicon_database($!wwc);
  }

  method get_plugins (
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    webkit_web_context_get_plugins(
      $!wwc, $cancellable, $callback, $user_data
    );
  }

  method get_plugins_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    webkit_web_context_get_plugins_finish($!wwc, $result, $error);
  }

  method get_security_manager {
    webkit_web_context_get_security_manager($!wwc);
  }

  method get_type {
    webkit_web_context_get_type();
  }

  method get_website_data_manager {
    webkit_web_context_get_website_data_manager($!wwc);
  }

  method initialize_notification_permissions (
    GList $allowed_origins,
    GList $disallowed_origins
  ) {
    webkit_web_context_initialize_notification_permissions(
      $!wwc, $allowed_origins, $disallowed_origins
    );
  }

  method is_automation_allowed {
    so webkit_web_context_is_automation_allowed($!wwc);
  }

  method is_ephemeral {
    so webkit_web_context_is_ephemeral($!wwc);
  }

  method prefetch_dns (Str() $hostname) {
    webkit_web_context_prefetch_dns($!wwc, $hostname);
  }

  method register_uri_scheme (
    Str() $scheme,
    WebKitURISchemeRequestCallback $callback,
    gpointer $user_data = Pointer,
    GDestroyNotify $user_data_destroy_func = Pointer
  ) {
    webkit_web_context_register_uri_scheme(
      $!wwc, $scheme, $callback, $user_data, $user_data_destroy_func
    );
  }

  method set_additional_plugins_directory (Str() $directory) {
    webkit_web_context_set_additional_plugins_directory($!wwc, $directory);
  }

  method set_automation_allowed (Int() $allowed) {
    my guint $a = self.RESOLVE-BOOL($allowed);
    webkit_web_context_set_automation_allowed($!wwc, $a);
  }

  method set_network_proxy_settings (
    Int() $proxy_mode,            # WebKitNetworkProxyMode $proxy_mode,
    WebKitNetworkProxySettings() $proxy_settings
  ) {
    my guint $pm = self.RESOLVE-UINT($proxy_mode);
    webkit_web_context_set_network_proxy_settings(
      $!wwc, $pm, $proxy_settings
    );
  }

  method set_web_extensions_directory (Str() $directory) {
    webkit_web_context_set_web_extensions_directory($!wwc, $directory);
  }

  method set_web_extensions_initialization_user_data (
    GVariant $user_data
  ) {
    webkit_web_context_set_web_extensions_initialization_user_data(
      $!wwc, $user_data
    );
  }

  method set_preferred_languages (
    WebKitWebContext $context,
    Str @languages
  ) {
    my $l = CArray[Str].new;
    for ^@languages.elems {
      $l[$_] = @languages[$_];
      LAST { $l[$_] + 1 = Str }
    }
    webkit_web_context_set_preferrred_languages($!wwc, $l);
  }


}
