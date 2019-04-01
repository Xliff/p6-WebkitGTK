use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebsiteData;
use GTK::Raw::Utils;

# BOXED TYPE

class WebkitGTK::WebsiteData {
  has WebKitWebsiteData $!wwd;

  submethod BUILD (:$data) {
    $!wwd = $data;
  }
  
  method WebkitGTK::Raw::Types::WebKitWebsiteData 
    is also<WebsteData> 
  { $!wwd }

  method new (WebKitWebsiteData $data) {
    self.bless(:$data);
  }

  method get_name 
    is also<
      get-name
      name
    > 
  {
    webkit_website_data_get_name($!wwd);
  }

  method get_size (
    Int() $types                  # WebKitWebsiteDataTypes $types
  ) 
    is also<
      get-size
      size
    > 
  {
    my guint $t = resolve-uint($types);
    webkit_website_data_get_size($!wwd, $t);
  }

  method get_type is also<get-type> {
    webkit_website_data_get_type();
  }

  method get_types 
    is also<
      get-types
      types
    > 
  {
    webkit_website_data_get_types($!wwd);
  }

  method ref is also<upref> {
    webkit_website_data_ref($!wwd);
    self;
  }

  method unref is also<downref> {
    webkit_website_data_unref($!wwd);
  }

}
