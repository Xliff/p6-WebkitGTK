use v6.c;

use Method::Also;
use NativeCall;


use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::MimeInfo;

# BOXED TYPE - 
#   ASSUMPTION! 
#     From /usr/include/webkitgtk-4.0/webkit2/WebKitMimeInfo.h
#     There was no WebKitMineInfoClass, nor any reference to GObject.

class WebkitGTK::MimeInfo {
  has WebKitMimeInfo $!wmi;

  submethod BUILD (:$info) {
    $!wmi = $info;
  }
  
  method WekitGTK::Raw::Types::WebKitMimeInfo is also<MinmeInfo> { $!wmi }

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
