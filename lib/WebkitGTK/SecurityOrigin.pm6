use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::SecurityOrigin;

# BOXED TYPE

class WebkitGTK::SecurityOrigin {
  has WebKitSecurityOrigin $!wso;

  submethod BUILD (:$origin) {
    $!wso = $origin;
  }

  method WebkitGTK::Raw::Definitions::WebKitSecurityOrigin
    is also<SecurityOrigin>
  { $!wso }

  multi method new (WebKitSecurityOrigin $origin) {
    return Nil unless $origin;

    my $o = self.bless(:$origin);
    #$o.upref;
    $o;
  }
  multi method new (Str() $protocol, Str() $host, Int() $port) {
    my gint16 $p = $port;
    my $origin = webkit_security_origin_new($protocol, $host, $p);

    $origin ?? self.bless(:$origin) !! Nil;
  }

  method new_for_uri(Str() $uri) is also<new-for-uri> {
    my $origin = webkit_security_origin_new_for_uri($uri);

    $origin ?? self.bless(:$origin) !! Nil;
  }

  method get_host is also<
    get-host
    host
  > {
    webkit_security_origin_get_host($!wso);
  }

  method get_port is also<
    get-port
    port
  > {
    webkit_security_origin_get_port($!wso);
  }

  method get_protocol is also<
    get-protocol
    protocol
  > {
    webkit_security_origin_get_protocol($!wso);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      webkit_security_origin_get_type();
      $n,
      $t
    );
  }

  method is_opaque is also<is-opaque> {
    so webkit_security_origin_is_opaque($!wso);
  }

  method ref is also<upref> {
    webkit_security_origin_ref($!wso);
    self;
  }

  # Alias to Str
  method to_string
    is also<
      to-string
      Str
    >
  {
    webkit_security_origin_to_string($!wso);
  }

  method unref is also<downref> {
    webkit_security_origin_unref($!wso);
  }

}
