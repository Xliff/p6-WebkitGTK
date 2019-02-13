use v6.c;

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

  method activate_item (guint $index) {
    webkit_option_menu_activate_item($!wom, $index);
  }

  method close {
    webkit_option_menu_close($!wom);
  }

  method get_item (Int() $index) {
    my guint $i = self.RESOLVE-UINT($index);
    WebkitGTK::OptionMenuItem.new(
      webkit_option_menu_get_item($!wom, $index)
    );
  }

  method get_n_items {
    webkit_option_menu_get_n_items($!wom);
  }

  method get_type {
    webkit_option_menu_get_type();
  }

  method select_item (Int() $index) {
    my guint $i = self.RESOLVE-UINT($index);
    webkit_option_menu_select_item($!wom, $index);
  }

}
