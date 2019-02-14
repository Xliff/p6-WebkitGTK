use v6.c;

use Method::Also;
use NativeCall;

use GTK::Raw::Utils;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::ApplicationInfo;

class WebkitGTK::ApplicationInfo {
  has WebKitApplicationInfo $!wai;

  submethod BUILD (:$info) {
    $!wai = $info;
  }

  submethod DESTROY {
    self.downref;
  }

  multi method new (WebKitApplicationInfo $info) {
    my $o = self.bless(:$info);
    $o.upref;
  }
  multi method new {
    self.bless( info => webkit_application_info_new() );
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
    webkit_application_info_get_type();
  }

  proto method get_version(|c)
    is also<get-version>
    { * }

  multi method get_version {
    my ($mj, $mn, $mc);
    samewith($mj, $mn, $mc);
  }
  multi method get_version (Int $major, Int $minor, Int $micro) {
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
    my uint64 ($mj, $mn, $mc) = resolve-ulong($major, $minor, $micro);
    webkit_application_info_set_version($!wai, $mj, $mn, $mc);
  }

  method unref is also<downref> {
    webkit_application_info_unref($!wai);
  }

}
