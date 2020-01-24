use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::OptionMenuItem;

class WebkitGTK::OptionMenuItem {
  has WebKitOptionMenuItem $!womi is implementor;

  submethod BUILD (:$item) {
    $!womi = $item;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitOptionMenuItem
    is also<
      OptionMenuItem
      WebKitOptionMenuItem
    >
  { $!womi }

  method new (WebKitOptionMenuItem $item) {
    $item ?? self.bless(:$item) !! Nil;
  }

  method copy (:$raw = False) {
    my $item = webkit_option_menu_item_copy($!womi);

    $item ?? WebkitGTK::OptionMenuItem.new($item) !! Nil;
  }

  method free {
    webkit_option_menu_item_free($!womi);
  }

  method get_label is also<get-label> {
    webkit_option_menu_item_get_label($!womi);
  }

  method get_tooltip is also<get-tooltip> {
    webkit_option_menu_item_get_tooltip($!womi);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_option_menu_item_get_type,
      $n,
      $t
    );
  }

  method is_enabled is also<is-enabled> {
    so webkit_option_menu_item_is_enabled($!womi);
  }

  method is_group_child is also<is-group-child> {
    so webkit_option_menu_item_is_group_child($!womi);
  }

  method is_group_label is also<is-group-label> {
    so webkit_option_menu_item_is_group_label($!womi);
  }

  method is_selected is also<is-selected> {
    so webkit_option_menu_item_is_selected($!womi);
  }

}
