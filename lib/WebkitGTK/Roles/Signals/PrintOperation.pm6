use v6.c;

use NativeCall;

use GLib::Raw::ReturnedValue;

use WebkitGTK::Raw::Types;

use GLib::Roles::Signals::Generic;

role WebkitGTK::Roles::Signals::PrintOperation {
  has %!signals-wpo;

  # WebKitPrintOperation, gpointer --> WebKitPrintCustomWidget
  method connect-create-custom-widget (
    $obj,
    $signal = 'create-custom-widget',
    &handler?
  ) {
    my $hid;
    %!signals-wpo{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-create-custom-widget($obj, $signal,
        -> $, $ud --> WebKitPrintCustomWidget {
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
    %!signals-wpo{$signal}[0].tap(&handler) with &handler;
    %!signals-wpo{$signal}[0];
  }

  # Also shared with WebkitGTK::Roles::Signals::Download -- Potential generic.
  # WebKitPrintOperation, GError, gpointer
  method connect-failed (
    $obj,
    $signal = 'failed',
    &handler?
  ) {
    my $hid;
    %!signals-wpo{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-failed($obj, $signal,
        -> $, $g, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $g, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wpo{$signal}[0].tap(&handler) with &handler;
    %!signals-wpo{$signal}[0];
  }
}

# WebKitPrintOperation, gpointer --> WebKitPrintCustomWidget
sub g-connect-create-custom-widget(
  Pointer $app,
  Str $name,
  &handler (Pointer, Pointer --> WebKitPrintCustomWidget),
  Pointer $data,
  uint32 $flags
)
returns uint64
is native('gobject-2.0')
is symbol('g_signal_connect_object')
{ * }

# WebKitPrintOperation, GError, gpointer
sub g-connect-failed(
  Pointer $app,
  Str $name,
  &handler (Pointer, GError, Pointer),
  Pointer $data,
  uint32 $flags
)
returns uint64
is native('gobject-2.0')
is symbol('g_signal_connect_object')
{ * }
