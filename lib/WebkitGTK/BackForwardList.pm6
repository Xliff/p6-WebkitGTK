use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::BackForwardList;

use WebkitGTK::Roles::Signals::BackForwardList;

use GLib::GList;
use WebkitGTK::BackForwardListItem;

use GLib::Roles::Object;
use GLib::Roles::ListData;

class WebkitGTK::BackForwardList {
  also does GLib::Roles::Object;
  also does WebkitGTK::Roles::Signals::BackForwardList;

  has WebKitBackForwardList $!wbfl is implementor;

  submethod BUILD (:$list) {
    $!wbfl = $list;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitBackForwardList
    is also<WebKitBackForwardList>
  { $!wbfl }

  method new (WebKitBackForwardList $list) {
    $list ?? self.bless(:$list) !! Nil;
  }

  # Is originally:
  # WebKitBackForwardList, WebKitBackForwardListItem, gpointer, gpointer --> void
  method changed {
    self.connect-changed($!wbfl, 'changed');
  }

  method get_back_item (:$raw = False) is also<get-back-item> {
    my $bli = webkit_back_forward_list_get_back_item($!wbfl);

    $bli ??
      ( $raw ?? $bli !! WebkitGTK::BackForwardListItem.new($bli) )
      !!
      Nil;
  }

  method get_back_list (:$glist = False, :$raw = False)
    is also<get-back-list>
  {
    my $bl = webkit_back_forward_list_get_back_list($!wbfl);

    return Nil unless $bl;
    return $bl if $glist;

    $bl = GLib::GList but GLib::Roles::ListData[WebKitBackForwardListItem];
    $raw ?? $bl.Array
         !! $bl.Array.new({ WebkitGTK::BackForwardListItem.new($_) });
  }

  method get_back_list_with_limit (
    Int() $limit,
    :$glist = False,
    :$raw   = False
  )
    is also<get-back-list-with-limit>
  {
    my guint $l = $limit;
    my $bl = webkit_back_forward_list_get_back_list_with_limit($!wbfl, $limit);

    return Nil unless $bl;
    return $bl if $glist;

    $bl = GLib::GList but GLib::Roles::ListData[WebKitBackForwardListItem];
    $raw ?? $bl.Array
         !! $bl.Array.new({ WebkitGTK::BackForwardListItem.new($_) });
  }

  method get_current_item (:$raw = False) is also<get-current-item> {
    my $li = webkit_back_forward_list_get_current_item($!wbfl);

    $li ??
      ( $raw ?? $li !! WebkitGTK::BackForwardListItem.new($li) )
      !!
      Nil;
  }

  method get_forward_item (:$raw = False) is also<get-forward-item> {
    my $li = webkit_back_forward_list_get_forward_item($!wbfl);

    $li ??
      ( $raw ?? $li !! WebkitGTK::BackForwardListItem.new($li) )
      !!
      Nil;
  }

  method get_forward_list(:$glist = False, :$raw = False)
    is also<get-forward-list>
  {
    my $fl = webkit_back_forward_list_get_forward_list($!wbfl);

    return Nil unless $fl;
    return $fl if $glist;

    $fl = GLib::GList but GLib::Roles::ListData[WebKitBackForwardListItem];
    $raw ?? $fl.Array
         !! $fl.Array.new({ WebkitGTK::BackForwardListItem.new($_) });
  }

  method get_forward_list_with_limit (
    Int() $limit,
    :$glist = False,
    :$raw   = False
  )
    is also<get-forward-list-with-limit>
  {
    my guint $l = $limit;
    my $fl = webkit_back_forward_list_get_forward_list_with_limit($!wbfl, $l);

    return Nil unless $fl;
    return $fl if $glist;

    $fl = GLib::GList but GLib::Roles::ListData[WebKitBackForwardListItem];
    $raw ?? $fl.Array
         !! $fl.Array.new({ WebkitGTK::BackForwardListItem.new($_) });
  }

  method get_length is also<get-length> {
    webkit_back_forward_list_get_length($!wbfl);
  }

  method get_nth_item (Int() $i, :$raw = False) is also<get-nth-item> {
    my guint $ii = $i;
    my $li = webkit_back_forward_list_get_nth_item($!wbfl, $ii);

    $li ??
      ( $raw ?? $li !! WebkitGTK::BackForwardListItem.new($li) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_back_forward_list_get_type, $n, $t );
  }

}
