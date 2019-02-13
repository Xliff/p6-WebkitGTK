use v6.c;

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

  method get_description {
    webkit_mime_info_get_description($!wmi);
  }

  method get_mime_type {
    webkit_mime_info_get_mime_type($!wmi);
  }

  method get_extensions {
    my ($cai, $e, @e) = (0);
    my $ca = webkit_mime_info_get_extensions($!wmi);
    @e.push($e) while ($e = $ca[$cai++]).defined;
    @e;
  }

  method get_type {
    webkit_mime_info_get_type();
  }

  method ref {
    webkit_mime_info_ref($!wmi);
  }

  method unref {
    webkit_mime_info_unref($!wmi);
  }

}
