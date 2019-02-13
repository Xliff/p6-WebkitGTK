use v6.c;

use GTK::Compat::Types;
use GTK::Raw::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PrintOperation;

use GTK::PageSetup;
use GTK::PrintSettings;

use WebkitGTK::Roles::Signals::PrintOperation;

class WebkitGTK::PrintOperation {
  also does WebkitGTK::Roles::Signals::PrintOperation;

  has WebKitPrintOperation $!wpo;

  submethod BUILD (:$op) {
    $!wpo = $op;
  }

  method WebkitGTK::Raw::Types::WebKitPrintOperation {
    $!wpo;
  }

  method new(WebKitWebView() $view) {
    self.bless( op => webkit_print_operation_new($view) );
  }

  # Is originally:
  # WebKitPrintOperation, gpointer --> WebKitPrintCustomWidget
  method create-custom-widget {
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

  method page_setup is rw {
    Proxy.new(
      FETCH => sub ($) {
        GTK::PageSetup.new( webkit_print_operation_get_page_setup($!wpo) );
      },
      STORE => sub ($, GtkPageSetup() $page_setup is copy) {
        webkit_print_operation_set_page_setup($!wpo, $page_setup);
      }
    );
  }

  method print_settings is rw {
    Proxy.new(
      FETCH => sub ($) {
        GTK::PrintSettings.new(
          webkit_print_operation_get_print_settings($!wpo)
        );
      },
      STORE => sub ($, GtkPrintSettings() $print_settings is copy) {
        webkit_print_operation_set_print_settings($!wpo, $print_settings);
      }
    );
  }

  method get_type {
    webkit_print_operation_get_type();
  }

  method print {
    webkit_print_operation_print($!wpo);
  }

  method run_dialog (GtkWindow() $parent) {
    WebKitPrintOperationResponse(
      webkit_print_operation_run_dialog($!wpo, $parent)
    );
  }

}
