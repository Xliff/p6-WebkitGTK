use v6.c;

use Method::Also;
use NativeCall;


use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::ContextMenuItem;

use GIO::Roles::Action;

class WebkitGTK::ContextMenuItem {
  also does GIO::Roles::Action;

  has WebKitContextMenuItem $!wcmi is implementor;

  submethod BUILD (:$menuitem) {
    $!wcmi = $menuitem;

    self!roleInit-Action;
  }

  method WebkitGTK::Raw::Definitions::WebKitContextMenuItem
    is also<
      WebKitContextMenuItem
      ContextMenuItem
    >
  { $!wcmi }

  method new_from_gaction (
    GAction() $action,
    Str() $label,
    GVariant() $target = GVariant
  )
    is also<new-from-gaction>
  {
    my $cmi = webkit_context_menu_item_new_from_gaction(
      $action, $label, $target
    );

    $cmi ?? self.bless( menuitem => $cmi ) !! Nil;
  }

  method new_from_stock_action (Int() $action)
    is also<new-from-stock-action>
  {
    my guint $a = $action;
    my $menuitem = webkit_context_menu_item_new_from_stock_action($a);

    $menuitem ?? self.bless( :$menuitem ) !! Nil;
  }

  method new_from_stock_action_with_label (
    Int() $action,
    Str() $label
  )
    is also<new-from-stock-action-with-label>
  {
    my guint $a = $action;
    my $cmi = webkit_context_menu_item_new_from_stock_action_with_label(
      $a,
      $label
    );

    $cmi ?? self.bless( menuitem => $cmi) !! Nil;
  }

  method new_separator is also<new-separator> {
    my $cmi = webkit_context_menu_item_new_separator();

    $cmi ?? self.bless( menuitem => $cmi ) !! Nil;
  }

  method new_with_submenu (Str() $label, WebKitContextMenu() $submenu)
    is also<new-with-submenu>
  {
    my $cmi = webkit_context_menu_item_new_with_submenu(
      $label,
      $submenu
    );

    $cmi ?? self.bless( menuitem => $cmi ) !! Nil;
  }

  method submenu is rw {
    Proxy.new(
      FETCH => sub ($) {
        my $sm = webkit_context_menu_item_get_submenu($!wcmi);

        $sm ?? ::('WebkitGTK::ContextMenu').new($sm) !! Nil;
      },
      STORE => sub ($, WebKitContextMenu() $submenu is copy) {
        webkit_context_menu_item_set_submenu($!wcmi, $submenu)
      }
    );
  }

  method get_gaction (:$raw = False)
    is also<
      get-gaction
      gaction
    >
  {
    my $ga = webkit_context_menu_item_get_gaction($!wcmi);

    $ga ??
      ( $raw ?? $ga !! GIO::Roles::Action.new-action-obj($ga) )
      !!
      Nil;
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
