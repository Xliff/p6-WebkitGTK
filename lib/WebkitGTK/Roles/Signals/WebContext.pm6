use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

role WebkitGTK::Roles::Signals::WebContext {
  has %!signals-wc;

  # WebKitWebContext, WebKitAutomationSession, gpointer --> void
  method connect-automation-started (
    $obj,
    $signal,
    &handler?
  ) {
    my $hid;
    %!signals-wc{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-automation-started($obj, $signal,
        -> $, $was, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $was, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wc{$signal}[0].tap(&handler) with &handler;
    %!signals-wc{$signal}[0];
  }

  # WebKitWebContext, WebKitDownload, gpointer --> void
  method connect-download-started (
    $obj,
    $signal,
    &handler?
  ) {
    my $hid;
    %!signals-wc{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-download-started($obj, $signal,
        -> $, $d, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $d, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wc{$signal}[0].tap(&handler) with &handler;
    %!signals-wc{$signal}[0];
  }
}

# WebKitWebContext, WebKitAutomationSession, gpointer --> void
sub g-connect-automation-started(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitAutomationSession, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebContext, WebKitDownload, gpointer --> void
sub g-connect-download-started(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitDownload, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
