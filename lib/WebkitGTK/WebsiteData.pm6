use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebsiteData;
use GTK::Raw::Utils;

class WebkitGTK::WebsiteData {
  has WebKitWebsiteData $!wwd;

  submethod BUILD (:$data) {
    $!wwd = $data;
  }

  method new (WebKitWebsiteData $data) {
    self.bless(:$data);
  }

  method get_name {
    webkit_website_data_get_name($!wwd);
  }

  method get_size (
    Int() $types                  # WebKitWebsiteDataTypes $types
  ) {
    my guint $t = resolve-uint($types);
    webkit_website_data_get_size($!wwd, $t);
  }

  method get_type {
    webkit_website_data_get_type();
  }

  method get_types {
    webkit_website_data_get_types($!wwd);
  }

  method ref {
    webkit_website_data_ref($!wwd);
    self;
  }

  method unref {
    webkit_website_data_unref($!wwd);
  }

}
