use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WebKitBackForwardListItem;

sub webkit_back_forward_list_item_get_original_uri (
  WebKitBackForwardListItem $list_item
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_item_get_title (
  WebKitBackForwardListItem $list_item
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_item_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_back_forward_list_item_get_uri (
  WebKitBackForwardListItem $list_item
)
  returns Str
  is native(webkit)
  is export
  { * }
