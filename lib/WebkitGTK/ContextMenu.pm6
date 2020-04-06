use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::ContextMenu;

use WebkitGTK::ContextMenuItem;

use GLib::Roles::Object;

class WebkitGTK::ContextMenu {
  also does GLib::Roles::Object;

  has WebKitContextMenu $!wcm is implementor;

  submethod BUILD (:$menu) {
    $!wcm = $menu;

    self.roleinit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitContextMenu
    is also<WebKitContextMenu>
  { $!wcm }

  method new {
    my $menu = webkit_context_menu_new();

    $menu ?? self.bless(:$menu) !! Nil;
  }

  method new_with_items(GList $items) is also<new-with-items> {
    my $menu = webkit_context_menu_new_with_items($items);

    $menu ?? self.bless(:$menu) !! Nil;
  }

  method user_data (:$raw = False) is rw {
    Proxy.new:
      FETCH => sub ($)                { self.get_user_data(:$raw) },
      STORE => -> $, GVariant() \v { self.set_user_data(v)     };
  }

  method append (WebKitContextMenuItem() $item) {
    webkit_context_menu_append($!wcm, $item);
  }

  method first (:$raw = False) {
    my $cmi = webkit_context_menu_first($!wcm);

    $cmi ??
      ( $raw ?? $cmi !! WebkitGTK::ContextMenuItem.new($cmi) )
      !!
      Nil;
  }

  method get_item_at_position (Int() $position, :$raw = False)
    is also<get-item-at-position>
  {
    my gint $p = $position;
    my $cmi = webkit_context_menu_get_item_at_position($!wcm, $position);

    $cmi ??
      ( $raw ?? $cmi !! WebkitGTK::ContextMenuItem.new($cmi) )
      !!
      Nil;
  }

  method get_items (:$glist = False, :$raw = False) is also<get-items> {
    my $il = webkit_context_menu_get_items($!wcm);

    return Nil unless $il;
    return $il if $glist;

    $il = GLib::GList.new($il)
      but GLib::Roles::ListData[WebKitContextMenuItem];
    $raw ?? $il.Array !! $il.Array.map({ WebkitGTK::ContextMenuItem.new($_) });
  }

  method get_n_items
    is also<
      get-n-items
      elems
    >
  {
    webkit_context_menu_get_n_items($!wcm);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_context_menu_get_type, $n, $t );
  }

  method get_user_data (:$raw = False) is also<get-user-data> {
    my $v = webkit_context_menu_get_user_data($!wcm);

    $v ??
      ( $raw ?? $v !! GLib::Variant.new($v) )
      !!
      Nil;
  }

  method insert (WebKitContextMenuItem() $item, Int() $position) {
    my gint $p = $position;

    webkit_context_menu_insert($!wcm, $item, $position);
  }

  method last (:$raw = False) {
    my $cmi = webkit_context_menu_last($!wcm);

    $cmi ??
      ( $raw ?? $cmi !! WebkitGTK::ContextMenuItem.new($cmi) )
      !!
      Nil;
  }

  method move_item (WebKitContextMenuItem() $item, Int() $position)
    is also<move-item>
  {
    my gint $p = $position;

    webkit_context_menu_move_item($!wcm, $item, $p);
  }

  method prepend (WebKitContextMenuItem() $item) {
    webkit_context_menu_prepend($!wcm, $item);
  }

  method remove (WebKitContextMenuItem() $item) {
    webkit_context_menu_remove($!wcm, $item);
  }

  method remove_all is also<remove-all> {
    webkit_context_menu_remove_all($!wcm);
  }

  method set_user_data (GVariant() $data) {
    webkit_context_menu_set_user_data($!wcm, $data);
  }

}
