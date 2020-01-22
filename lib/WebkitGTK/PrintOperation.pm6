use v6.c;

use Method::Also;



use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PrintOperation;

use GLib::Roles::Object;

use WebkitGTK::Roles::Signals::PrintOperation;

use GTK::PageSetup;
use GTK::PrintSettings;

class WebkitGTK::PrintOperation {
  also does GLib::Roles::Object;
  
  also does WebkitGTK::Roles::Signals::PrintOperation;

  has WebKitPrintOperation $!wpo;

  submethod BUILD (:$op) {
    self!setObject($!wpo = $op);
  }

  method WebkitGTK::Raw::Definitions::WebKitPrintOperation 
    is also<PrintOperation>
  { $!wpo }

  method new(WebKitWebView() $view) {
    self.bless( op => webkit_print_operation_new($view) );
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

  method page_setup is rw is also<page-setup> {
    Proxy.new(
      FETCH => sub ($) {
        GTK::PageSetup.new( webkit_print_operation_get_page_setup($!wpo) );
      },
      STORE => sub ($, GtkPageSetup() $page_setup is copy) {
        webkit_print_operation_set_page_setup($!wpo, $page_setup);
      }
    );
  }

  method print_settings is rw is also<print-settings> {
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

  method get_type is also<get-type> {
    webkit_print_operation_get_type();
  }

  method print {
    webkit_print_operation_print($!wpo);
  }

  method run_dialog (GtkWindow() $parent) is also<run-dialog> {
    WebKitPrintOperationResponse(
      webkit_print_operation_run_dialog($!wpo, $parent)
    );
  }

}
