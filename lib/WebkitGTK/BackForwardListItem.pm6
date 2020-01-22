use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::BackForwardListItem;

class WebkitGTK::BackForwardListItem {
  has WebKitBackForwardListItem $!wbfli;

  submethod BUILD (:$item) {
    $!wbfli = $item;
  }

  method WebkitGTK::Raw::Definitions::WebKitBackForwardListItem {
    $!wbfli;
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
    webkit_back_forward_list_item_get_type();
  }

  method webkit_back_forward_list_item_get_uri 
    is also<webkit-back-forward-list-item-get-uri> 
  {
    webkit_back_forward_list_item_get_uri($!wbfli);
  }

}
