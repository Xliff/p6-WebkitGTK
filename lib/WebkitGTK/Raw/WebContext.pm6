use v6.c;

use NativeCall;

use GTK::Compat::Types;

use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WebContext;

sub webkit_web_context_allow_tls_certificate_for_host (
  WebKitWebContext $context,
  GTlsCertificate $certificate,
  Str $host
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_clear_cache (WebKitWebContext $context)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_download_uri (WebKitWebContext $context, Str $uri)
  returns WebKitDownload
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_cookie_manager (WebKitWebContext $context)
  returns WebKitCookieManager
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_default ()
  returns WebKitWebContext
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_favicon_database (WebKitWebContext $context)
  returns WebKitFaviconDatabase
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_plugins (
  WebKitWebContext $context,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_plugins_finish (
  WebKitWebContext $context,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_security_manager (WebKitWebContext $context)
  returns WebKitSecurityManager
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_website_data_manager (WebKitWebContext $context)
  returns WebKitWebsiteDataManager
  is native(webkit)
  is export
  { * }

sub webkit_web_context_initialize_notification_permissions (
  WebKitWebContext $context,
  GList $allowed_origins,
  GList $disallowed_origins
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_is_automation_allowed (WebKitWebContext $context)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_context_is_ephemeral (WebKitWebContext $context)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_context_new ()
  returns WebKitWebContext
  is native(webkit)
  is export
  { * }

sub webkit_web_context_new_ephemeral ()
  returns WebKitWebContext
  is native(webkit)
  is export
  { * }

sub webkit_web_context_new_with_website_data_manager (
  WebKitWebsiteDataManager $manager
)
  returns WebKitWebContext
  is native(webkit)
  is export
  { * }

sub webkit_web_context_prefetch_dns (WebKitWebContext $context, Str $hostname)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_register_uri_scheme (
  WebKitWebContext $context,
  Str $scheme,
  WebKitURISchemeRequestCallback $callback,
  gpointer $user_data,
  GDestroyNotify $user_data_destroy_func
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_additional_plugins_directory (
  WebKitWebContext $context,
  Str $directory
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_automation_allowed (
  WebKitWebContext $context,
  gboolean $allowed
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_network_proxy_settings (
  WebKitWebContext $context,
  guint $proxy_mode,              # WebKitNetworkProxyMode $proxy_mode,
  WebKitNetworkProxySettings $proxy_settings
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_web_extensions_directory (
  WebKitWebContext $context,
  Str $directory
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_web_extensions_initialization_user_data (
  WebKitWebContext $context,
  GVariant $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_favicon_database_directory (
  WebKitWebContext $context
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_spell_checking_enabled (
  WebKitWebContext $context
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_web_process_count_limit (WebKitWebContext $context)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_process_model (WebKitWebContext $context)
  returns guint # WebKitProcessModel
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_cache_model (WebKitWebContext $context)
  returns guint # WebKitCacheModel
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_tls_errors_policy (WebKitWebContext $context)
  returns guint # WebKitTLSErrorsPolicy
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_favicon_database_directory (
  WebKitWebContext $context,
  Str $path
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_spell_checking_enabled (
  WebKitWebContext $context,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_web_process_count_limit (
  WebKitWebContext $context,
  guint $limit
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_process_model (
  WebKitWebContext $context,
  guint $process_model            # WebKitProcessModel $process_model
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_cache_model (
  WebKitWebContext $context,
  guint $cache_model              # WebKitCacheModel $cache_model
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_tls_errors_policy (
  WebKitWebContext $context,
  guint $policy                   # WebKitTLSErrorsPolicy $policy
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_get_spell_checking_languages  (
  WebKitWebContext $context
)
  is native(webkit)
  is export
  { * }

sub webkit_web_context_set_preferred_languages (
  WebKitWebContext $context,
  CArray[Str]  $languages
)
  is native(webkit)
  is export
  { * }
