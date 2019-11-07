use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Compat::FileTypes;
use GTK::Raw::ReturnedValue;
use WebkitGTK::Raw::Types;

#use WebkitGTK::Roles::Signals::Download;

role WebkitGTK::Roles::Signals::WebResource {
#  also does WebkitGTK::Roles::Signals::Download;

  has %!signals-wr;

  # WebKitWebResource, GTlsCertificate, GTlsCertificateFlags, gpointer
  method connect-failed-with-tls-errors (
    $obj,
    $signal = 'failed-with-tls-errors',
    &handler?
  ) {
    my $hid;
    %!signals-wr{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-failed-with-tls-errors($obj, $signal,
        -> $, $c, $cf, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $c, $cf, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wr{$signal}[0].tap(&handler) with &handler;
    %!signals-wr{$signal}[0];
  }

  # WebKitWebResource, WebKitURIRequest, WebKitURIResponse, gpointer
  method connect-sent-request (
    $obj,
    $signal = 'sent-request',
    &handler?
  ) {
    my $hid;
    %!signals-wr{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-sent-request($obj, $signal,
        -> $, $ur1, $ur2, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $ur1, $ur2, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wr{$signal}[0].tap(&handler) with &handler;
    %!signals-wr{$signal}[0];
  }


}

# WebKitWebResource, GTlsCertificate, GTlsCertificateFlags, gpointer
sub g-connect-failed-with-tls-errors(
  Pointer $app,
  Str $name,
  &handler (Pointer, GTlsCertificate, GTlsCertificateFlags, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebResource, WebKitURIRequest, WebKitURIResponse, gpointer
sub g-connect-sent-request(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitURIRequest, WebKitURIResponse, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
