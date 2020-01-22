use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

role WebkitGTK::Roles::Signals::BackForwardList {
  has %!signals-wbfl;

# WebKitBackForwardList, WebKitBackForwardListItem, gpointer, gpointer
  method connect-changed (
    $obj,
    $signal = 'changed',
    &handler?
    ) {
    my $hid;
    %!signals-wbfl{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-changed($obj, $signal,
        -> $, $wkbflim, $gr, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $wkbflim, $gr, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wbfl{$signal}[0].tap(&handler) with &handler;
    %!signals-wbfl{$signal}[0];
  }
}

# WebKitBackForwardList, WebKitBackForwardListItem, gpointer, gpointer
sub g-connect-changed(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitBackForwardListItem, gpointer, Pointer),
  Pointer $data,
  uint32 $flags
)
returns uint64
is native('gobject-2.0')
is symbol('g_signal_connect_object')
{ * }
