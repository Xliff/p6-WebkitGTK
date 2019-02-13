use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::OptionMenuItem;

class WebkitGTK::OptionMenuItem {
  has WebKitOptionMenuItem $!womi;

  submethod BUILD (:$item) {
    $!womi = $item;
  }

  method new (WebKitOptionMenuItem $item) {
    self.bless(:$item);
  }

  method copy {
    self.bless( item => webkit_option_menu_item_copy($!womi) );
  }

  method free {
    webkit_option_menu_item_free($!womi);
  }

  method get_label {
    webkit_option_menu_item_get_label($!womi);
  }

  method get_tooltip {
    webkit_option_menu_item_get_tooltip($!womi);
  }

  method get_type {
    webkit_option_menu_item_get_type();
  }

  method is_enabled {
    so webkit_option_menu_item_is_enabled($!womi);
  }

  method is_group_child {
    so webkit_option_menu_item_is_group_child($!womi);
  }

  method is_group_label {
    so webkit_option_menu_item_is_group_label($!womi);
  }

  method is_selected {
    so webkit_option_menu_item_is_selected($!womi);
  }

}
