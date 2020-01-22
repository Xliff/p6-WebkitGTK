use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::ApplicationInfo;

class WebkitGTK::ApplicationInfo {
  has WebKitApplicationInfo $!wai;

  submethod BUILD (:$info) {
    $!wai = $info;
  }

  submethod DESTROY {
    self.unref;
  }

  method WebkitGTK::Raw::Definitions::WebKitApplicationInfo
    is also<WebKitApplicationInfo>
  { $!wai }

  multi method new (WebKitApplicationInfo $info, :$ref = True) {
    return Nil unless $info;

    my $o = self.bless(:$info);
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $info = webkit_application_info_new();

    $info ?? self.bless(:$info) !! Nil;
  }

  method name is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_application_info_get_name($!wai);
      },
      STORE => sub ($, $name is copy) {
        webkit_application_info_set_name($!wai, $name);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_application_info_get_type, $n, $t );
  }

  proto method get_version(|)
    is also<get-version>
  { * }

  multi method get_version {
    samewith($, $, $);
  }
  multi method get_version ($major is rw, $minor is rw, $micro is rw) {
    my uint64 ($mj, $mn, $mc) = (0, 0, 0);

    webkit_application_info_get_version($!wai, $mj, $mn, $mc);
    ($major, $minor, $micro) = ($mj, $mn, $mc);
  }

  method ref is also<upref> {
    webkit_application_info_ref($!wai);
    self;
  }

  method set_version (Int() $major, Int() $minor, Int() $micro)
    is also<set-version>
  {
    my uint64 ($mj, $mn, $mc) = ($major, $minor, $micro);

    webkit_application_info_set_version($!wai, $mj, $mn, $mc);
  }

  method unref is also<downref> {
    webkit_application_info_unref($!wai);
  }

}
