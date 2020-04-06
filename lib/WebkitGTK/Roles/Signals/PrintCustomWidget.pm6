use v6.c;

use NativeCall;

use WebkitGTK::Raw::Types;

use GLib::Roles::Signals::Generic;

role WebkitGTK::Roles::Signals::PrintCustomWidget {
  also does GLib::Roles::Signals::Generic;

  has %!signals-wpcw;

  # WebKitPrintCustomWidget, GtkPageSetup, GtkPrintSettings, gpointer
  method connect-update (
    $obj,
    $signal = 'update',
    &handler?
  ) {
    my $hid;
    %!signals-wpcw{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-update($obj, $signal,
        -> $, $gpsp, $gpss, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $gpsp, $gpss, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wpcw{$signal}[0].tap(&handler) with &handler;
    %!signals-wpcw{$signal}[0];
  }

}

# WebKitPrintCustomWidget, GtkPageSetup, GtkPrintSettings, gpointer
sub g-connect-update(
  Pointer $app,
  Str $name,
  &handler (Pointer, GtkPageSetup, GtkPrintSettings, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
