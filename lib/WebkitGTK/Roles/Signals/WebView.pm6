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
  method authenticate (
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
  #method context-menu {

  # WebKitWebView, WebKitNavigationAction, gpointer --> GtkWidget
  #method create {

  # WebKitWebView, WebKitPolicyDecision, WebKitPolicyDecisionType, gpointer
  #method decide-policy {



  # WebKitWebView, WebKitLoadEvent, gchar, GError, gpointer --> gboolean
  #method load-failed

  # WebKitWebView, gchar, GTlsCertificate, GTlsCertificateFlags, gpointer --> gboolean
  #method load-failed-with-tls-errors

  # WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
  #method mouse-target-changed

  # WebKitWebView, WebKitPermissionRequest, gpointer -> gboolean
  #method permission-request

  # WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
  #method print {

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
