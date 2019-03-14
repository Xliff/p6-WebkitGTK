use v6.c;

use Method::Also;
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

  method new_for_uri(Str() $uri) is also<new-for-uri> {
    self.bless( origin => webkit_security_origin_new_for_uri($uri) );
  }

  method get_host is also<get-host> {
    webkit_security_origin_get_host($!wso);
  }

  method get_port is also<get-port> {
    webkit_security_origin_get_port($!wso);
  }

  method get_protocol is also<get-protocol> {
    webkit_security_origin_get_protocol($!wso);
  }

  method get_type is also<get-type> {
    webkit_security_origin_get_type();
  }

  method is_opaque is also<is-opaque> {
    so webkit_security_origin_is_opaque($!wso);
  }

  method ref {
    webkit_security_origin_ref($!wso);
    self;
  }

  # Alias to Str
  method to_string is also<to-string> {
    webkit_security_origin_to_string($!wso);
  }

  method unref {
    webkit_security_origin_unref($!wso);
  }

}

