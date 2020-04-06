use v6.c;

use NativeCall;



use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::PrintOperation;

sub webkit_print_operation_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_print_operation_new (WebKitWebView $web_view)
  returns WebKitPrintOperation
  is native(webkit)
  is export
  { * }

sub webkit_print_operation_print (WebKitPrintOperation $print_operation)
  is native(webkit)
  is export
  { * }

sub webkit_print_operation_run_dialog (
  WebKitPrintOperation $print_operation,
  GtkWindow $parent
)
  returns uint32 # WebKitPrintOperationResponse
  is native(webkit)
  is export
  { * }

sub webkit_print_operation_get_print_settings (
  WebKitPrintOperation $print_operation
)
  returns GtkPrintSettings
  is native(webkit)
  is export
  { * }

sub webkit_print_operation_get_page_setup (
  WebKitPrintOperation $print_operation
)
  returns GtkPageSetup
  is native(webkit)
  is export
  { * }

sub webkit_print_operation_set_print_settings (
  WebKitPrintOperation $print_operation,
  GtkPrintSettings $print_settings
)
  is native(webkit)
  is export
  { * }

sub webkit_print_operation_set_page_setup (
  WebKitPrintOperation $print_operation,
  GtkPageSetup $page_setup
)
  is native(webkit)
  is export
  { * }
