use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::BackForwardListItem;

use GLib::Roles::Object;

class WebkitGTK::BackForwardListItem {
  also does GLib::Roles::Object;

  has WebKitBackForwardListItem $!wbfli is implementor;

  submethod BUILD (:$item) {
    $!wbfli = $item;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitBackForwardListItem
    is also<WebKitBackForwardListItem>
  { $!wbfli }

  method new (WebKitBackForwardListItem $item) {
    $item ?? self.bless(:$item) !! Nil;
  }

  method webkit_back_forward_list_item_get_original_uri
    is also<webkit-back-forward-list-item-get-original-uri>
  {
    webkit_back_forward_list_item_get_original_uri($!wbfli);
  }

  method webkit_back_forward_list_item_get_title
    is also<webkit-back-forward-list-item-get-title>
  {
    webkit_back_forward_list_item_get_title($!wbfli);
  }

  method webkit_back_forward_list_item_get_type
    is also<webkit-back-forward-list-item-get-type>
  {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      webkit_back_forward_list_item_get_type(),
      $n,
      $t
    );
  }

  method webkit_back_forward_list_item_get_uri
    is also<webkit-back-forward-list-item-get-uri>
  {
    webkit_back_forward_list_item_get_uri($!wbfli);
  }

}
