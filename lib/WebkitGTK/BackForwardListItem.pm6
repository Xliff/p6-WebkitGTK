use v6.c;

use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::BackForwardListItem;

class WebkitGTK::BackForwardListItem {
  has WebKitBackForwardListItem $!wbfli;

  submethod BUILD (:$item) {
    $!wbfli = $item;
  }

  method webkit_back_forward_list_item_get_original_uri {
    webkit_back_forward_list_item_get_original_uri($!wbfli);
  }

  method webkit_back_forward_list_item_get_title {
    webkit_back_forward_list_item_get_title($!wbfli);
  }

  method webkit_back_forward_list_item_get_type {
    webkit_back_forward_list_item_get_type();
  }

  method webkit_back_forward_list_item_get_uri {
    webkit_back_forward_list_item_get_uri($!wbfli);
  }

}
