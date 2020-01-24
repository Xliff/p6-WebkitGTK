use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PrintOperation;

use GTK::PageSetup;
use GTK::PrintSettings;
use WebkitGTK::WebView;

use GLib::Roles::Object;
use WebkitGTK::Roles::Signals::PrintOperation;

class WebkitGTK::PrintOperation {
  also does GLib::Roles::Object;
  also does WebkitGTK::Roles::Signals::PrintOperation;

  has WebKitPrintOperation $!wpo;

  submethod BUILD (:$op) {
    self!setObject($!wpo = $op);
  }

  method WebkitGTK::Raw::Definitions::WebKitPrintOperation
    is also<
      PrintOperation
      WebKitPrintOperation
    >
  { $!wpo }

  method new(WebKitWebView() $view) {
    my $op = webkit_print_operation_new($view);

    $op ?? self.bless(:$op) !! Nil;
  }

  # Is originally:
  # WebKitPrintOperation, gpointer --> WebKitPrintCustomWidget
  method create-custom-widget is also<create_custom_widget> {
    self.connect-create-custom-widget($!wpo);
  }

  # Is originally:
  # WebKitPrintOperation, GError, gpointer --> void
  method failed {
    self.connect-failed($!wpo);
  }

  # Is originally:
  # WebKitPrintOperation, gpointer --> void
  method finished {
    self.connect($!wpo, 'finished');
  }

  method page_setup (:$raw = False) is rw is also<page-setup> {
    Proxy.new(
      FETCH => sub ($) {
        my $ps = webkit_print_operation_get_page_setup($!wpo);

        $ps ??
          ( $raw ?? $ps !! GTK::PageSetup.new($ps) )
          !!
          Nil;
      },
      STORE => sub ($, GtkPageSetup() $page_setup is copy) {
        webkit_print_operation_set_page_setup($!wpo, $page_setup);
      }
    );
  }

  method print_settings (:$raw = False) is rw is also<print-settings> {
    Proxy.new(
      FETCH => sub ($) {
        my $ps = webkit_print_operation_get_print_settings($!wpo);

        $ps ??
          ( $raw ?? $ps !! GTK::PrintSettings.new($ps) )
          !!
          Nil;
      },
      STORE => sub ($, GtkPrintSettings() $print_settings is copy) {
        webkit_print_operation_set_print_settings($!wpo, $print_settings);
      }
    );
  }

  # Type: WebKitWebView
  method web-view (:$raw = False) is rw  {
    my $gv;
    Proxy.new(
      FETCH => -> $ {
        $gv = GLib::Value.new(
          self.prop_get('web-view', $gv)
        );

        return Nil unless $gv.object;

        my $wv = cast(WebKitWebView, $gv.object);
        $raw ?? $wv !! WebkitGTK::WebView.new($wv);
      },
      STORE => -> $, WebKitWebView() $val is copy {
        $gv = GLib::Value.new( G_TYPE_OBJECT );
        $gv.object = $val;
        self.prop_set('web-view', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_print_operation_get_type,
      $n,
      $t
    );
  }

  method print {
    webkit_print_operation_print($!wpo);
  }

  method run_dialog (GtkWindow() $parent) is also<run-dialog> {
    WebKitPrintOperationResponseEnum(
      webkit_print_operation_run_dialog($!wpo, $parent)
    );
  }

}
