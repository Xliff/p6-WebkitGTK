use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::BackForwardList;

use GTK::Roles::Types;
use WebkitGTK::Roles::Signals::BackForwardList;

use WebkitGTK::BackForwardListItem;

class WebkitGTK::BackForwardList {
  also does GTK::Roles::Types;
  also does WebkitGTK::Roles::Signals::BackForwardList;

  has WebKitBackForwardList $!wbfl;

  submethod BUILD (:$list) {
    $!wbfl = $list;
  }

  method WebkitGTK::Raw::Types::WebKitBackForwardList {
    $!wbfl;
  }

  method new (WebKitBackForwardList $list) {
    self.bless(:$list);
  }

  # Is originally:
  # WebKitBackForwardList, WebKitBackForwardListItem, gpointer, gpointer --> void
  method changed {
    self.connect-changed($!wbfl, 'changed');
  }

  method get_back_item is also<get-back-item> {
    WebkitGTK::BackForwardListItem.new(
      webkit_back_forward_list_get_back_item($!wbfl)
    );
  }

  method get_back_list is also<get-back-list> {
    webkit_back_forward_list_get_back_list($!wbfl);
  }

  method get_back_list_with_limit (Int() $limit) 
    is also<get-back-list-with-limit> 
  {
    my guint $l = self.RESOLVE-UINT($limit);
    webkit_back_forward_list_get_back_list_with_limit($!wbfl, $limit);
  }

  method get_current_item is also<get-current-item> {
    WebkitGTK::BackForwardListItem.new(
      webkit_back_forward_list_get_current_item($!wbfl)
    );
  }

  method get_forward_item is also<get-forward-item> {
    WebkitGTK::BackForwardListItem.new(
      webkit_back_forward_list_get_forward_item($!wbfl)
    );
  }

  method get_forward_list is also<get-forward-list> {
    webkit_back_forward_list_get_forward_list($!wbfl);
  }

  method get_forward_list_with_limit (Int() $limit) 
    is also<get-forward-list-with-limit> 
  {
    my guint $l = self.RESOLVE-UINT($limit);
    webkit_back_forward_list_get_forward_list_with_limit($!wbfl, $l);
  }

  method get_length is also<get-length> {
    webkit_back_forward_list_get_length($!wbfl);
  }

  method get_nth_item (Int() $i) is also<get-nth-item> {
    my guint $ii = self.RESOLVE-INT($i);
    WebkitGTK::BackForwardListItem.new(
      webkit_back_forward_list_get_nth_item($!wbfl, $ii)
    );
  }

  method get_type is also<get-type> {
    webkit_back_forward_list_get_type();
  }

}
