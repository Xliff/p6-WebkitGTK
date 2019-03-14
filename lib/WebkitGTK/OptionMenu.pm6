use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::OptionMenu;

use WebkitGTK::OptionMenuItem;

use GTK::Roles::Types;

class WebkitGTK::OptionMenu {
  also does GTK::Roles::Types;

  has WebKitOptionMenu $!wom;

  submethod BUILD (:$menu) {
    $!wom = $menu;
  }

  method new (WebKitOptionMenu $menu) {
    self.bless(:$menu);
  }

  method activate_item (guint $index) is also<activate-item> {
    webkit_option_menu_activate_item($!wom, $index);
  }

  method close {
    webkit_option_menu_close($!wom);
  }

  method get_item (Int() $index) is also<get-item> {
    my guint $i = self.RESOLVE-UINT($index);
    WebkitGTK::OptionMenuItem.new(
      webkit_option_menu_get_item($!wom, $index)
    );
  }

  method get_n_items is also<get-n-items> {
    webkit_option_menu_get_n_items($!wom);
  }

  method get_type is also<get-type> {
    webkit_option_menu_get_type();
  }

  method select_item (Int() $index) is also<select-item> {
    my guint $i = self.RESOLVE-UINT($index);
    webkit_option_menu_select_item($!wom, $index);
  }

}

