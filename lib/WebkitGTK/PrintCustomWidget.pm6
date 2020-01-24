use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PrintCustomWidget;

use GTK::Widget;

use GLib::Roles::Object;
use WebkitGTK::Roles::Signals::PrintCustomWidget;

class WebkitGTK::PrintCustomWidget {
  also does GLib::Roles::Object;
  also does WebkitGTK::Roles::Signals::PrintCustomWidget;

  has WebKitPrintCustomWidget $!wpcw;

  submethod BUILD (:$print-widget) {
    self!setObject($!wpcw = $print-widget)
  }

  method WebkitGTK::Raw::Definitions::WebKitPrintCustomWidget
    is also<
      PrintCustomWidget
      WebKitPrintCustomWidget
    >
  { $!wpcw }

  method new (GtkWidget() $widget, Str() $title) {
    my $print-widget = webkit_print_custom_widget_new($widget, $title);

    $print-widget ?? self.bless(:$print-widget) !! Nil;
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
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_print_custom_widget_get_type,
      $n,
      $t
    );
  }

  method get_widget (:$raw = False, :$widget = False)
    is also<
      get-widget
      widget
    >
  {
    my $w = webkit_print_custom_widget_get_widget($!wpcw);

    ReturnWidget($w, $raw, $widget);
  }

}
