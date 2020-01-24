use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::NetworkProxySettings;

# BOXED

class WebkitGTK::NetworkProxySettings {
  has WebKitNetworkProxySettings $!wnps;

  submethod BUILD (:$settings) {
    $!wnps = $settings;
  }

  multi method WebkitGTK::Raw::Definitions::WebKitNetworkProxySettings
    is also<WebKitNetworkProxySettings>
  { $!wnps }

  multi method new (WebKitNetworkProxySettings $settings) {
    $settings ?? self.bless(:$settings) !! Nil;
  }
  multi method new (
    Str() $default_proxy_uri,
    @ignore_hosts
  ) {
    samewith($default_proxy_uri, ArrayToCArray(Str, @ignore_hosts) );
  }
  multi method new (
    Str $default_proxy_uri,
    CArray[Str] $ignore_hosts
  ) {
    my $settings = webkit_network_proxy_settings_new(
      $default_proxy_uri,
      $ignore_hosts
    );

    $settings ?? self.bless(:$settings) !! Nil;
  }

  method copy {
    my $settings = webkit_network_proxy_settings_copy($!wnps);

    $settings ?? self.bless(:$settings) !! Nil;
  }

  method add_proxy_for_scheme (Str() $scheme, Str() $proxy_uri)
    is also<add-proxy-for-scheme>
  {
    webkit_network_proxy_settings_add_proxy_for_scheme(
      $!wnps,
      $scheme,
      $proxy_uri
    );
  }

  method free {
    webkit_network_proxy_settings_free($!wnps);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_network_proxy_settings_get_type,
      $n,
      $t
    );
  }

}
