use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::NetworkProxySettings;

sub webkit_network_proxy_settings_add_proxy_for_scheme (
  WebKitNetworkProxySettings $proxy_settings,
  Str $scheme,
  Str $proxy_uri
)
  is native(webkit)
  is export
  { * }

sub webkit_network_proxy_settings_new (
  Str $default_proxy_uri,
  CArray[Str] $ignore_hosts
)
  returns WebKitNetworkProxySettings
  is native(webkit)
  is export
  { * }

sub webkit_network_proxy_settings_copy (WebKitNetworkProxySettings $proxy_settings)
  returns WebKitNetworkProxySettings
  is native(webkit)
  is export
  { * }

sub webkit_network_proxy_settings_free (WebKitNetworkProxySettings $proxy_settings)
  is native(webkit)
  is export
  { * }

sub webkit_network_proxy_settings_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
