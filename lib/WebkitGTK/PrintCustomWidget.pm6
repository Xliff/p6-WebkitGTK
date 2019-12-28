use v6.c;

use Method::Also;

use GTK::Compat::Types;
use GTK::Raw::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PrintCustomWidget;

use GLib::Roles::Object;

use WebkitGTK::Roles::Signals::PrintCustomWidget;

class WebkitGTK::PrintCustomWidget {
  also does GLib::Roles::Object;
  
  also does WebkitGTK::Roles::Signals::PrintCustomWidget;

  has WebKitPrintCustomWidget $!wpcw;

  submethod BUILD (:$widget) {
    self!setObject($!wpcw = $widget);
  }

  method WebkitGTK::Raw::Types::WebKitPrintCustomWidget 
    is also<PrintCustomWidget>
  { $!wpcw }

  method new (GtkWidget() $widget, Str() $title) {
    self.bless( widget => webkit_print_custom_widget_new($widget, $title) );
  }

  # Is originally:
  # WebKitPrintCustomWidget, gpointer --> void
  method apply {
    self.connect($!wpcw, 'apply');
  }

  # Is originally:
  # WebKitPrintCustomWidget, GtkPageSetup, GtkPrintSettings, gpointer --> void
  method update {
    self.connect-update($!wpcw);
  }

  method get_title 
    is also<
      get-title
      title
    >  
  {
    webkit_print_custom_widget_get_title($!wpcw);
  }

  method get_type is also<get-type> {
    webkit_print_custom_widget_get_type();
  }

  method get_widget 
    is also<
      get-widget
      widget
    > 
  {
    # Determining the widget is up too the caller.
    webkit_print_custom_widget_get_widget($!wpcw);
  }

}
