use v6.c;

use NativeCall;

use WebkitGTK::Raw::Types;

role WebkitGTK::Roles::Signals::UserContentManager {
  has %!signals-ucm;

  # WebKitUserContentManager, WebKitJavascriptResult, gpointer --> void
  method connect-script-message-received (
    $obj,
    $signal = 'script-script-message-received',
    &handler?
  ) {
    my $hid;
    %!signals-ucm{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-script-message-received($obj, $signal,
        -> $, $jsr, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $jsr, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-ucm{$signal}[0].tap(&handler) with &handler;
    %!signals-ucm{$signal}[0];
  }

}

# WebKitUserContentManager, WebKitJavascriptResult, gpointer --> void
sub g-connect-script-message-received(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitJavascriptResult, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
