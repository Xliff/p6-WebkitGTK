use v6.c;

use NativeCall;


use GTK::Raw::ReturnedValue;
use WebkitGTK::Raw::Types;

role WebkitGTK::Roles::Signals::AutomationSession {
  has %!signals-was;

  # WebKitAutomationSession, gpointer --> WebKitWebView
  method connect-create-web-view (
    $obj,
    $signal = 'create-web-view',
    &handler?
  ) {
    my $hid;
    %!signals-was{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-create-web-view($obj, $signal,
        -> $, $ud --> WebKitWebView {
          CATCH {
            default { $s.quit($_) }
          }

          my $r = ReturnedValue.new;
          $s.emit( [self, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-was{$signal}[0].tap(&handler) with &handler;
    %!signals-was{$signal}[0];
  }

}


# WebKitAutomationSession, gpointer --> WebKitWebView
sub g-connect-create-web-view(
  Pointer $app,
  Str $name,
  &handler (Pointer, Pointer --> WebKitWebView),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
