use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::ContextMenu;

use GTK::Roles::Types;

class WebkitGTK::ContextMenu {
  also does GTK::Roles::Types;

  has WebKitContextMenu $!wcm;

  submethod BUILD (:$menu) {
    $!wcm = $menu;
  }

  method WebkitGTK::Raw::Types::WebKitContextMenu {
    $!wcm;
  }

  method new {
    self.bless( menu => webkit_context_menu_new() );
  }

  method new_with_items(GList $items) {
    self.bless( menu => webkit_context_menu_new_with_items($items) );
  }

  method append (WebKitContextMenuItem() $item) {
    webkit_context_menu_append($!wcm, $item);
  }

  method first {
    WebkitGTK::ContextMenuItem.new( webkit_context_menu_first($!wcm) );
  }

  method get_item_at_position (Int() $position) {
    my gint $p = self.RESOLVE-INT($position);
    WebkitGTK::ContextMenuItem.new(
      webkit_context_menu_get_item_at_position($!wcm, $position)
    );
  }

  method get_items {
    webkit_context_menu_get_items($!wcm);
  }

  method get_n_items {
    webkit_context_menu_get_n_items($!wcm);
  }

  method get_type {
    webkit_context_menu_get_type();
  }

  method insert (WebKitContextMenuItem() $item, Int() $position) {
    my gint $p = self.RESOLVE-INT($position);
    webkit_context_menu_insert($!wcm, $item, $position);
  }

  method last {
    WebkitGTK::ContextMenuItem.new( webkit_context_menu_last($!wcm) );
  }

  method move_item (WebKitContextMenuItem() $item, Int() $position) {
    my gint $p = self.RESOLVE-INT($position);
    webkit_context_menu_move_item($!wcm, $item, $p);
  }

  method prepend (WebKitContextMenuItem() $item) {
    webkit_context_menu_prepend($!wcm, $item);
  }

  method remove (WebKitContextMenuItem() $item) {
    webkit_context_menu_remove($!wcm, $item);
  }

  method remove_all {
    webkit_context_menu_remove_all($!wcm);
  }

}
