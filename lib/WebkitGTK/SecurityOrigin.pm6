use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::SecurityOrigin;
use GTK::Raw::Utils;

class WebkitGTK::SecurityOrigin {
  has WebKitSecurityOrigin $!wso;

  submethod BUILD (:$origin) {
    $!wso = $origin;
  }

  multi method new (WebKitSecurityOrigin $origin) {
    my $o = self.bless(:$origin);
    $o.upref;
  }
  multi method new (Str() $protocol, Str() $host, Int() $port) {
    my gint16 $p = resolve-uint16($port);
    self.bless( origin => webkit_security_origin_new($protocol, $host, $p) )
  }

  method new_for_uri(Str() $uri) {
    self.bless( origin => webkit_security_origin_new_for_uri($uri) );
  }

  method get_host {
    webkit_security_origin_get_host($!wso);
  }

  method get_port {
    webkit_security_origin_get_port($!wso);
  }

  method get_protocol {
    webkit_security_origin_get_protocol($!wso);
  }

  method get_type {
    webkit_security_origin_get_type();
  }

  method is_opaque {
    so webkit_security_origin_is_opaque($!wso);
  }

  method ref {
    webkit_security_origin_ref($!wso);
    self;
  }

  # Alias to Str
  method to_string {
    webkit_security_origin_to_string($!wso);
  }

  method unref {
    webkit_security_origin_unref($!wso);
  }

}
