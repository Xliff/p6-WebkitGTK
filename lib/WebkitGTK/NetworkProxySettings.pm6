use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::NetworkProxySettings;

class WebkitGTK::NetworkProxySettings {
  has WebKitNetworkProxySettings $!wnps;

  submethod BUILD (:$settings) {
    $!wnps = $settings;
  }

  multi method new (WebKitNetworkProxySettings $settings) {
    self.bless(:$settings);
  }
  multi method new (
    Str() $default_proxy_uri,
    @ignore_hosts
  ) {
    my $ih = CArray[Str].new(@ignore_hosts);
    samewith($default_proxy_uri, $ih);
  }
  multi method new (
    Str $default_proxy_uri,
    CArray[Str] $ignore_hosts
  ) {
    self.bless(
      settings => webkit_network_proxy_settings_new(
        $default_proxy_uri, $ignore_hosts
      )
    );
  }

  method copy {
    self.bless(
      settings => webkit_network_proxy_settings_copy($!wnps)
    );
  }

  method add_proxy_for_scheme (Str() $scheme, Str() $proxy_uri) 
    is also<add-proxy-for-scheme> 
  {
    webkit_network_proxy_settings_add_proxy_for_scheme(
      $!wnps, $scheme, $proxy_uri
    );
  }

  method free {
    webkit_network_proxy_settings_free($!wnps);
  }

  method get_type is also<get-type> {
    webkit_network_proxy_settings_get_type();
  }

}
