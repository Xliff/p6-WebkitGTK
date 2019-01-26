use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::ContextMenuItem;

use GTK::Compat::Action;

use GTK::Roles::Types;

class WebkitGTK::ContextMenuItem {
  also does GTK::Roles::Types;

  has WebKitContextMenuItem $!wcmi;

  submethod BUILD (:$menuitem) {
    $!wcmi = $menuitem;
  }

  method WebkitGTK::Raw::Types::WebKitContextMenuItem {
    $!wcmi;
  }

  method new_from_gaction (
    GAction() $action,
    Str() $label,
    GVariant $target = GVariant
  ) {
    self.bless( menuitem => webkit_context_menu_item_new_from_gaction(
      $action, $label, $target
    ) );
  }

  method new_from_stock_action (Int() $action) {
    my guint $a = self.RESOLVE-UINT($action);
    my $menuitem = webkit_context_menu_item_new_from_stock_action($a);
    self.bless(:$menuitem);
  }

  method new_from_stock_action_with_label (
    Int() $action,
    Str() $label
  ) {
    my guint $a = self.RESOLVE-UINT($action);
    self.bless(
      menuitem => webkit_context_menu_item_new_from_stock_action_with_label(
        $a, $label
      )
    );
  }

  method new_separator {
    self.bless( menuitem => webkit_context_menu_item_new_separator() );
  }

  method new_with_submenu (Str() $label, WebKitContextMenu() $submenu) {
    self.bless( menuitem => webkit_context_menu_item_new_with_submenu(
      $label, $submenu
    ) );
  }

  method submenu is rw {
    Proxy.new(
      FETCH => sub ($) {
        ::('WebkitGTK::ContextMenu').new(
          webkit_context_menu_item_get_submenu($!wcmi)
        );
      },
      STORE => sub ($, WebKitContextMenu() $submenu is copy) {
        webkit_context_menu_item_set_submenu($!wcmi, $submenu)
      }
    );
  }

  method get_gaction {
    GTK::Compat::Action.new(
      webkit_context_menu_item_get_gaction($!wcmi)
    );
  }

  method get_stock_action {
    WebKitContextMenuAction(
      webkit_context_menu_item_get_stock_action($!wcmi)
    );
  }

  method get_type {
    webkit_context_menu_item_get_type();
  }

  method is_separator {
    webkit_context_menu_item_is_separator($!wcmi);
  }

}
