use v6.c;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WindowProperties;

class WebkitGTK::WindowProperties {
  has WebKitWindowProperties  $!wwp;

  submethod BLESS (:$props) {
    $!wwp = $props;
  }

  method WebkitGTK::Raw::Types::WebKitWindowProperties {
    $!wwp;
  }

  method new (WebKitWindowProperties $props) {
    self.bless(:$props);
  }

  method get_fullscreen {
    webkit_window_properties_get_fullscreen($!wwp);
  }

  proto method get_geometry (|c)
    { * }

  multi method get_geometry {
    my $r = GdkRectangle.new;
    samewith($r);
  }
  multi method get_geometry (GdkRectangle $geometry) {
    webkit_window_properties_get_geometry($!wwp, $geometry);
  }

  method get_locationbar_visible {
    so webkit_window_properties_get_locationbar_visible($!wwp);
  }

  method get_menubar_visible {
    so webkit_window_properties_get_menubar_visible($!wwp);
  }

  method get_resizable {
    so webkit_window_properties_get_resizable($!wwp);
  }

  method get_scrollbars_visible {
    so webkit_window_properties_get_scrollbars_visible($!wwp);
  }

  method get_statusbar_visible {
    so webkit_window_properties_get_statusbar_visible($!wwp);
  }

  method get_toolbar_visible {
    so webkit_window_properties_get_toolbar_visible($!wwp);
  }

  method get_type {
    webkit_window_properties_get_type();
  }

}
