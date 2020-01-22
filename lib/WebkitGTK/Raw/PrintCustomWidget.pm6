use v6.c;

use NativeCall;



use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::PrintCustomWidget;

sub webkit_print_custom_widget_get_title (
  WebKitPrintCustomWidget $print_custom_widget
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_print_custom_widget_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_print_custom_widget_get_widget (
  WebKitPrintCustomWidget $print_custom_widget
)
  returns GtkWidget
  is native(webkit)
  is export
  { * }

sub webkit_print_custom_widget_new (GtkWidget $widget, Str $title)
  returns WebKitPrintCustomWidget
  is native(webkit)
  is export
  { * }
