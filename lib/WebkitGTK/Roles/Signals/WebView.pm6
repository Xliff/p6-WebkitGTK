use v6.c;

use NativeCall;

use GLib::Raw::ReturnedValue;
use WebkitGTK::Raw::Types;

use GLib::Roles::Signals::Generic;

role WebkitGTK::Roles::Signals::WebView {
  also does GLib::Roles::Signals::Generic;

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

          my $r = GLib::Raw::ReturnedValue;
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

          my $r = GLib::Raw::ReturnedValue;
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

          my $r = GLib::Raw::ReturnedValue;
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

          my $r = GLib::Raw::ReturnedValue;
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

          my $r = GLib::Raw::ReturnedValue;
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
  method connect-mouse-target (
    $obj,
    $signal = 'mouse-target-changed',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-mouse-target($obj, $signal,
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
  method connect-permission-request (
    $obj,
    $signal = 'permission-request',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-permission-request($obj, $signal,
        -> $, $pr, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GLib::Raw::ReturnedValue;
          $s.emit( [self, $pr, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
  method connect-print (
    $obj,
    $signal = 'print',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-print($obj, $signal,
        -> $, $po, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GLib::Raw::ReturnedValue;
          $s.emit( [self, $po, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
  method connect-resource-load-started (
    $obj,
    $signal = 'resource-load-started',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-resource-load-started($obj, $signal,
        -> $, $rc, $ur, $ud {
          CATCH {
            default { note($_) }
          }

          $s.emit( [self, $rc, $ur, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
  method connect-run-color-chooser (
    $obj,
    $signal = 'run-color-chooser',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-color-chooser($obj, $signal,
        -> $, $cc, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GLib::Raw::ReturnedValue;
          $s.emit( [self, $cc, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitFileChooserRequest, gpointer --> gboolean
  method connect-run-file-chooser (
    $obj,
    $signal = 'run-file-chooser',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-file-chooser($obj, $signal,
        -> $, $fc, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GLib::Raw::ReturnedValue;
          $s.emit( [self, $fc, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
  method connect-script-dialog (
    $obj,
    $signal = 'script-dialog',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-script-dialog($obj, $signal,
        -> $, $sd, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GLib::Raw::ReturnedValue;
          $s.emit( [self, $sd, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitNotification, gpointer --> gboolean
  method connect-show-notification (
    $obj,
    $signal = 'show-notification',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-show-notification($obj, $signal,
        -> $, $n, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GLib::Raw::ReturnedValue;
          $s.emit( [self, $n, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitOptionMenu, GdkEvent, GdkRectangle, gpointer --> gboolean
  method connect-show-option-menu  (
    $obj,
    $signal = 'show-option-menu',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-show-option-menu($obj, $signal,
        -> $, $om, $e, $rect, $ud --> gboolean {
          CATCH {
            default { note($_) }
          }

          my $r = GLib::Raw::ReturnedValue;
          $s.emit( [self, $om, $e, $rect, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

  # WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
  method connect-submit-form (
    $obj,
    $signal = 'submit-form',
    &handler?
  ) {
    my $hid;
    %!signals-wv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-form-submission-request($obj, $signal,
        -> $, $fsr, $ud {
          CATCH {
            default { note($_) }
          }

          $s.emit( [self, $fsr, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-wv{$signal}[0].tap(&handler) with &handler;
    %!signals-wv{$signal}[0];
  }

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
sub g-connect-mouse-target(
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

# WebKitWebView, WebKitPermissionRequest, gpointer -> gboolean
sub g-connect-permission-request (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitPermissionRequest, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
sub g-connect-print (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitPrintOperation, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
sub g-connect-resource-load-started (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitWebResource, WebKitURIRequest, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
sub g-connect-color-chooser (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitColorChooserRequest, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
sub g-connect-file-chooser (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitFileChooserRequest, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
sub g-connect-script-dialog (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitScriptDialog, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitNotification, gpointer --> gboolean
sub g-connect-show-notification (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitNotification, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitOptionMenu, GdkEvent, GdkRectangle, gpointer --> gboolean
sub g-connect-show-option-menu (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitOptionMenu, GdkEvent, GdkRectangle, Pointer --> gboolean),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }

# WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
sub g-connect-form-submission-request (
  Pointer $app,
  Str $name,
  &handler (Pointer, WebKitFormSubmissionRequest, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
