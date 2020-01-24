use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WindowProperties;

use GLib::Roles::Object;

class WebkitGTK::WindowProperties {
  also does GLib::Roles::Object;

  has WebKitWindowProperties  $!wwp;

  submethod BLESS (:$props) {
    self!setObject($!wwp = $props);
  }

  method WebkitGTK::Raw::Definitions::WebKitWindowProperties
    is also<
      WindowProperties
      WebKitWindowProperties
    >
  { $!wwp }

  method new (WebKitWindowProperties $props) {
    $props ?? self.bless(:$props) !! Nil;
  }

  method get_fullscreen is also<get-fullscreen> {
    so webkit_window_properties_get_fullscreen($!wwp);
  }

  proto method get_geometry (|c)
    is also<get-geometry>
  { * }

  multi method get_geometry {
    my $r = GdkRectangle.new;
    samewith($r);
  }
  multi method get_geometry (GdkRectangle $geometry) {
    webkit_window_properties_get_geometry($!wwp, $geometry);
    $geometry;
  }

  method get_locationbar_visible
    is also<
      get-locationbar-visible
      locationbar_visible
      locationbar-visible
    >
  {
    so webkit_window_properties_get_locationbar_visible($!wwp);
  }

  method get_menubar_visible
    is also<
      get-menubar-visible
      menubar_visible
      menubar-visible
    >
  {
    so webkit_window_properties_get_menubar_visible($!wwp);
  }

  method get_resizable
    is also<
      get-resizable
      resizeable
    >
  {
    so webkit_window_properties_get_resizable($!wwp);
  }

  method get_scrollbars_visible
    is also<
      get-scrollbars-visible
      scrollbars_visible
      scrollbars-visible
    >
  {
    so webkit_window_properties_get_scrollbars_visible($!wwp);
  }

  method get_statusbar_visible
    is also<
      get-statusbar-visible
      statusbar_visible
      statusbar-visible
    >
  {
    so webkit_window_properties_get_statusbar_visible($!wwp);
  }

  method get_toolbar_visible
    is also<
      get-toolbar-visible
      toolbar_visible
      toolbar-visible
    >
  {
    so webkit_window_properties_get_toolbar_visible($!wwp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_window_properties_get_type,
      $n,
      $t
    );
  }

}
