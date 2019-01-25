use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::ContextMenuItem;

sub webkit_context_menu_item_get_gaction (WebKitContextMenuItem $item)
  returns GAction
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_get_stock_action (WebKitContextMenuItem $item)
  returns guint # WebKitContextMenuAction
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_is_separator (WebKitContextMenuItem $item)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_new_from_gaction (
  GAction $action,
  gchar $label,
  GVariant $target
)
  returns WebKitContextMenuItem
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_new_from_stock_action (
  guint $action                   # WebKitContextMenuAction $action
)
  returns WebKitContextMenuItem
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_new_from_stock_action_with_label (
  guint $action,                  # WebKitContextMenuAction $action,
  gchar $label
)
  returns WebKitContextMenuItem
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_new_separator ()
  returns WebKitContextMenuItem
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_new_with_submenu (
  gchar $label,
  WebKitContextMenu $submenu
)
  returns WebKitContextMenuItem
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_get_submenu (WebKitContextMenuItem $item)
  returns WebKitContextMenu
  is native(webkit)
  is export
  { * }

sub webkit_context_menu_item_set_submenu (
  WebKitContextMenuItem $item,
  WebKitContextMenu $submenu
)
  is native(webkit)
  is export
  { * }
