use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::OptionMenu;

sub webkit_option_menu_activate_item (WebKitOptionMenu $menu, guint $index)
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_close (WebKitOptionMenu $menu)
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_get_item (WebKitOptionMenu $menu, guint $index)
  returns WebKitOptionMenuItem
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_get_n_items (WebKitOptionMenu $menu)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_select_item (WebKitOptionMenu $menu, guint $index)
  is native(webkit)
  is export
  { * }
