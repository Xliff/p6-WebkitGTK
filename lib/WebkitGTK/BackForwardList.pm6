use v6.c;

use NativeCall;

use GTK::Compat::Type;
use WebkitGTK::Raw::Type;

use GTK::Roles::Types;
use WebkitGTK::Roles::Signals::BackForwardList;

use WebkitGTK::BackForwardListItem;

class WebkitGTK::BackForwardList {
  also does GTK::Roles::Types;
  also does WebkitGTK::Roles::Signals::BackForwardList;

  # Is originally:
  # WebKitBackForwardList, WebKitBackForwardListItem, gpointer, gpointer --> void
  method changed {
    self.connect-changed($!wbfl, 'changed');
  }

  method get_back_item {
    WebkitGTK::BackForwardListIte.new(
      mwebkit_back_forward_list_get_back_item($!wbfl)
    );
  }

  method get_back_list {
    webkit_back_forward_list_get_back_list($!wbfl);
  }

  method get_back_list_with_limit (guint $limit) {
    my guint $l = self.RESOLVE-UINT($limit);
    webkit_back_forward_list_get_back_list_with_limit($!wbfl, $limit);
  }

  method get_current_item {
    WebkitGTK::BackForwardListItem.new(
      webkit_back_forward_list_get_current_item($!wbfl)
    );
  }

  method get_forward_item {
    WebkitGTK:BackListItem.new(
      webkit_back_forward_list_get_forward_item($!wbfl)
    );
  }

  method get_forward_list {
    webkit_back_forward_list_get_forward_list($!wbfl);
  }

  method get_forward_list_with_limit (Int() $limit) {
    my guint $l = self.RESOLVE-UINT($l);
    webkit_back_forward_list_get_forward_list_with_limit($!wbfl, $l);
  }

  method get_length {
    webkit_back_forward_list_get_length($!wbfl);
  }

  method get_nth_item (Int() $i) {
    my guint $i = self.RESOLVE-INT($limit);
    WebkitGTK::BackForwardListItem.new(
      webkit_back_forward_list_get_nth_item($!wbfl, $i)
    );
  }

  method get_type {
    webkit_back_forward_list_get_type();
  }

}
