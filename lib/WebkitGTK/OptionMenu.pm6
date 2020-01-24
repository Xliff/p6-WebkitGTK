use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::OptionMenu;

use WebkitGTK::OptionMenuItem;

use GLib::Roles::Object;

class WebkitGTK::OptionMenu {
  also does GLib::Roles::Object;

  has WebKitOptionMenu $!wom;

  submethod BUILD (:$menu) {
    self!setObject($!wom = $menu);
  }

  method WebkitGTK::Raw::Definitions::WebKitOptionMenu
    is also<
      OptionMenu
      WebKitOptionMenu
    >
  { $!wom }

  method new (WebKitOptionMenu $menu) {
    $menu ?? self.bless(:$menu) !! Nil;
  }

  method activate_item (Int() $index) is also<activate-item> {
    my guint $i = $index;

    webkit_option_menu_activate_item($!wom, $i);
  }

  method close {
    webkit_option_menu_close($!wom);
  }

  method get_item (Int() $index, :$raw = False) is also<get-item> {
    my guint $i = $index;

    my $mi = webkit_option_menu_get_item($!wom, $index);

    $mi ??
      ( $raw ?? $mi !! WebkitGTK::OptionMenuItem.new($mi) )
      !!
      Nil;
  }

  method get_n_items
    is also<
      get-n-items
      elems
    >
  {
    webkit_option_menu_get_n_items($!wom);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_option_menu_get_type,
      $n,
      $t
    );
  }

  method select_item (Int() $index) is also<select-item> {
    my guint $i = $index;
    
    webkit_option_menu_select_item($!wom, $index);
  }

}
