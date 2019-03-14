use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::MimeInfo;

class WebkitGTK::MimeInfo {
  has WebKitMimeInfo $!wmi;

  submethod BUILD (:$info) {
    $!wmi = $info;
  }

  method new (WebKitMimeInfo $info) {
    self.bless(:$info);
  }

  method get_description is also<get-description> {
    webkit_mime_info_get_description($!wmi);
  }

  method get_mime_type is also<get-mime-type> {
    webkit_mime_info_get_mime_type($!wmi);
  }

  method get_extensions is also<get-extensions> {
    my ($cai, $e, @e) = (0);
    my $ca = webkit_mime_info_get_extensions($!wmi);
    @e.push($e) while ($e = $ca[$cai++]).defined;
    @e;
  }

  method get_type is also<get-type> {
    webkit_mime_info_get_type();
  }

  method ref {
    webkit_mime_info_ref($!wmi);
  }

  method unref {
    webkit_mime_info_unref($!wmi);
  }

}

