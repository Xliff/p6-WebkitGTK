use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::OptionMenuItem;

sub webkit_option_menu_item_copy (WebKitOptionMenuItem $item)
  returns WebKitOptionMenuItem
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_free (WebKitOptionMenuItem $item)
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_get_label (WebKitOptionMenuItem $item)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_get_tooltip (WebKitOptionMenuItem $item)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_is_enabled (WebKitOptionMenuItem $item)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_is_group_child (WebKitOptionMenuItem $item)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_is_group_label (WebKitOptionMenuItem $item)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_option_menu_item_is_selected (WebKitOptionMenuItem $item)
  returns uint32
  is native(webkit)
  is export
  { * }
