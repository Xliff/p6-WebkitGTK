use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebsiteData;

# BOXED TYPE

class WebkitGTK::WebsiteData {
  has WebKitWebsiteData $!wwd;

  submethod BUILD (:$data) {
    $!wwd = $data;
  }

  method WebkitGTK::Raw::Definitions::WebKitWebsiteData
    is also<WebsteData>
  { $!wwd }

  method new (WebKitWebsiteData $data) {
    $data ?? self.bless(:$data) !! Nil;
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
    my guint $t = $types;

    webkit_website_data_get_size($!wwd, $t);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_website_data_get_type, $n, $t );
  }

  method get_types
    is also<
      get-types
      types
    >
  {
    # Bitmask
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
