use v6.c;

use NativeCall;

use GLib::Raw::ReturnedValue;
use WebkitGTK::Raw::Types;

use GLib::Roles::Signals::Generic;

role WebkitGTK::Roles::Signals::Download {
  also does GLib::Roles::Signals::Generic;

  has %!signals-wd;

  # WebKitDownload, gchar, gpointer --> gboolean
  method connect-decide-destination (
    $obj,
    $signal = 'decide-destination',
    &handler?
  ) {
    my $hid;
    %!signals-wd{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-decide-destination($obj, $signal,
        -> $, $gr, $ud --> gboolean {
          CATCH {
            default { $s.quit($_) }
          }

          my $r = ReturnedValue.new;
          $s.emit( [self, $gr, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wd{$signal}[0].tap(&handler) with &handler;
    %!signals-wd{$signal}[0];
  }

  # WebKitDownload, GError, gpointer
  method connect-failed (
    $obj,
    $signal = 'failed',
    &handler?
  ) {
    my $hid;
    %!signals-wd{$signal} //= do {
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
    %!signals-wd{$signal}[0].tap(&handler) with &handler;
    %!signals-wd{$signal}[0];
  }

}

# WebKitDownload, gchar, gpointer --> gboolean
sub g-connect-decide-destination(
  Pointer $app,
  Str $name,
  &handler (Pointer, Str, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitDownload, GError, gpointer
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
