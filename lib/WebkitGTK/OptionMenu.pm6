use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::OptionMenu;

use WebkitGTK::OptionMenuItem;

use GTK::Compat::Roles::Object;

use GTK::Roles::Types;

# BOXED TYPE

class WebkitGTK::OptionMenu {
  also does GTK::Compat::Roles::Object;
  
  also does GTK::Roles::Types;

  has WebKitOptionMenu $!wom;

  submethod BUILD (:$menu) {
    self!setObject($!wom = $menu);
  }
  
  method WebkitGTK::Raw::Types::WebKitOptionMenu is also<OptionMenu> { $!wom }

  method new (WebKitOptionMenu $menu) {
    self.bless(:$menu);
  }

  method activate_item (Int() $index) is also<activate-item> {
    my guint $i = self.RESOLVE-UINT($index);
    webkit_option_menu_activate_item($!wom, $i);
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
