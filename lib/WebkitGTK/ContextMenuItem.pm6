use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::ContextMenuItem;

use GTK::Compat::Roles::Action;

use GTK::Roles::Types;

class WebkitGTK::ContextMenuItem {
  also does GTK::Compat::Roles::Action;
  also does GTK::Roles::Types;

  has WebKitContextMenuItem $!wcmi;

  submethod BUILD (:$menuitem) {
    $!a = nativecast(GAction, $!wcmi = $menuitem);  # GTK::Compat::Roles::Action
  }

  method WebkitGTK::Raw::Types::WebKitContextMenuItem
    is also<ContextMenuItem>
  { $!wcmi }

  method new_from_gaction (
    GAction() $action,
    Str() $label,
    GVariant() $target = GVariant
  )
    is also<new-from-gaction>
  {
    self.bless( menuitem => webkit_context_menu_item_new_from_gaction(
      $action, $label, $target
    ) );
  }

  method new_from_stock_action (Int() $action)
    is also<new-from-stock-action>
  {
    my guint $a = self.RESOLVE-UINT($action);
    my $menuitem = webkit_context_menu_item_new_from_stock_action($a);
    self.bless(:$menuitem);
  }

  method new_from_stock_action_with_label (
    Int() $action,
    Str() $label
  )
    is also<new-from-stock-action-with-label>
  {
    my guint $a = self.RESOLVE-UINT($action);
    self.bless(
      menuitem => webkit_context_menu_item_new_from_stock_action_with_label(
        $a, $label
      )
    );
  }

  method new_separator is also<new-separator> {
    self.bless( menuitem => webkit_context_menu_item_new_separator() );
  }

  method new_with_submenu (Str() $label, WebKitContextMenu() $submenu)
    is also<new-with-submenu>
  {
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

  method get_gaction
    is also<
      get-gaction
      gaction
    >
  {
    webkit_context_menu_item_get_gaction($!wcmi)
  }

  method get_stock_action
    is also<
      get-stock-action
      stock_action
      stock-action
    >
  {
    WebKitContextMenuAction(
      webkit_context_menu_item_get_stock_action($!wcmi)
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);
    unstable_get_type( self.^name, &webkit_context_menu_item_get_type, $n, $t );
  }

  method is_separator is also<is-separator> {
    so webkit_context_menu_item_is_separator($!wcmi);
  }

}
