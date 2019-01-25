use v6.c;

use NativeCall;

use GTK::Compat::Types;

use GTK::Raw::ReturnedValue;
use WebkitGTK::Raw::Types;

use GTK::Roles::Signals::Generic;

role WebkitGTK::Roles::Signals::WebView {
  also does GTK::Roles::Signals::Generic;

  has %!signals-wv;

  # WebKitWebView, WebKitAuthenticationRequest, gpointer --> gboolean
  method connect-authenticate (
    $obj,
    $signal = 'authenticate',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-authenticate($obj, $signal,
        -> $, $ar, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GTK::Raw::ReturnedValue;
          $s.emit( [self, $ar, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitContextMenu, GdkEvent, WebKitHitTestResult, gpointer --> gboolean
  method connect-context-menu (
    $obj,
    $signal = 'context-menu',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-context-menu($obj, $signal,
        -> $, $m, $e, $tr, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GTK::Raw::ReturnedValue;
          $s.emit( [self, $m, $e, $tr, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitNavigationAction, gpointer --> WebKitWebView (GtkWidget)
  method create (
    $obj,
    $signal = 'create',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-create($obj, $signal,
        -> $, $na, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GTK::Raw::ReturnedValue;
          $s.emit( [self, $na, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitPolicyDecision, guint (WebKitPolicyDecisionType), gpointer
  method decide-policy (
    $obj,
    $signal = 'decide-policy',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-decide-policy($obj, $signal,
        -> $, $pd, $d, $ud {
          CATCH {
            default { note($_) }
          }

          $s.emit( [self, $pd, $d, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, guint (WebKitLoadEvent), gchar, GError, gpointer --> gboolean
  method load-failed (
    $obj,
    $signal = 'load-failed',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-load-failed($obj, $signal,
        -> $, $le, $f, $e, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GTK::Raw::ReturnedValue;
          $s.emit( [self, $le, $f, $e, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, gchar, GTlsCertificate, GTlsCertificateFlags, gpointer --> gboolean
  method load-failed-with-tls-errors (
    $obj,
    $signal = 'load-failed',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-load-failed-with-tls-errors($obj, $signal,
        -> $, $f, $c, $e, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GTK::Raw::ReturnedValue;
          $s.emit( [self, $f, $c, $e, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
  method mouse-target-changed (
    $obj,
    $signal = 'mouse-target-changed',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-mouse-target-changed($obj, $signal,
        -> $, $htr, $i, $ud {
          CATCH {
            default { note($_) }
          }

          $s.emit( [self, $htr, $i, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitPermissionRequest, gpointer -> gboolean
  #method permission-request

  # WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
  #method print

  # WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
  #method resource-load-started

  # WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
  #method run-color-chooser

  # WebKitWebView, WebKitFileChooserRequest, gpointer --> gboolean
  #run-file-chooser

  # WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
  #script-dialog

  # WebKitWebView, WebKitNotification, gpointer --> gboolean
  #show-notification

  # WebKitWebView, WebKitOptionMenu, GdkEvent, GdkRectangle, gpointer --> gboolean
  #connect-show-option-menu

  # WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
  #submit-form

}

sub g-connect-authenticate(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitAuthenticationRequest, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitContextMenu, GdkEvent, WebKitHitTestResult, gpointer --> gboolean
sub g-connect-context-menu(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitContextMenu, GdkEvent, WebKitHitTestResult, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
sub g-connect-mouse-target-changed(
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitHitTestResult, guint, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitNavigationAction, gpointer --> WebKitWebView (GtkWidget)
sub g-connect-create (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitNavigationAction, Pointer --> WebKitWebView),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitPolicyDecision, guint (WebKitPolicyDecisionType), gpointer
sub g-connect-decide-policy (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitPolicyDecision, guint, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, guint (WebKitLoadEvent), gchar, GError, gpointer --> gboolean
sub g-connect-load-failed (
  Pointer $app,
  Str $name,
  &handler (Pointer, guint, Str, GError, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, gchar, GTlsCertificate, guint (GTlsCertificateFlags), gpointer --> gboolean
sub g-connect-load-failed-with-tls-errors (
  Pointer $app,
  Str $name,
  &handler (Pointer, Str, GTlsCertificate, guint, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
