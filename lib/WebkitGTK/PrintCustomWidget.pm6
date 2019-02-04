use v6.c;

use GTK::Compat::Types;
use GTK::Raw::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PrintCustomWidget;

use WebkitGTK::Roles::Signals::PrintCustomWidget;

class WebkitGTK::PrintCustomWidget {
  also does WebkitGTK::Roles::Signals::PrintCustomWidget;

  has WebKitPrintCustomWidget $!wpcw;

  submethod BUILD (:$widget) {
    $!wpcw = $widget;
  }

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

  method get_title {
    webkit_print_custom_widget_get_title($!wpcw);
  }

  method get_type {
    webkit_print_custom_widget_get_type();
  }

  method get_widget {
    webkit_print_custom_widget_get_widget($!wpcw);
  }

}
