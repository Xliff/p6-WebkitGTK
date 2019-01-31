use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::BackForwardList;

sub webkit_back_forward_list_get_back_list (
  WebKitBackForwardList $back_forward_list
)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_back_list_with_limit (
  WebKitBackForwardList $back_forward_list, guint $limit
)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_current_item (
  WebKitBackForwardList $back_forward_list
)
  returns WebKitBackForwardListItem
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_forward_item (
  WebKitBackForwardList $back_forward_list
)
  returns WebKitBackForwardListItem
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_forward_list (
  WebKitBackForwardList $back_forward_list
)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_forward_list_with_limit (
  WebKitBackForwardList $back_forward_list, guint $limit
)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_length (
  WebKitBackForwardList $back_forward_list
)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_nth_item (
  WebKitBackForwardList $back_forward_list, gint $index
)
  returns WebKitBackForwardListItem
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
