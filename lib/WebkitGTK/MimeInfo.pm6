use v6.c;

use Method::Also;

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

  method WekitGTK::Raw::Types::WebKitMimeInfo
    is also<
      MinmeInfo
      WebKitMimeInfo
    >
  { $!wmi }

  method new (WebKitMimeInfo $info) {
    $info ?? self.bless(:$info) !! Nil;
  }

  method get_description is also<get-description> {
    webkit_mime_info_get_description($!wmi);
  }

  method get_mime_type is also<get-mime-type> {
    webkit_mime_info_get_mime_type($!wmi);
  }

  method get_extensions is also<get-extensions> {
    my $ca = webkit_mime_info_get_extensions($!wmi);

    $ca ?? CStringArrayToArray($ca) !! Nil;

  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_mime_info_get_type, $n, $t );
  }

  method ref {
    webkit_mime_info_ref($!wmi);
    self;
  }

  method unref {
    webkit_mime_info_unref($!wmi);
  }

}
