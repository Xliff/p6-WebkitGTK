use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::ColorChooserRequest;

use GDK::RGBA;

use GLib::Roles::Object;
use GLib::Roles::Signals::Generic;

class WebkitGTK::ColorChooserRequest {
  also does GLib::Roles::Object;
  also does GLib::Roles::Signals::Generic;

  has WebKitColorChooserRequest $!wccr;

  submethod BUILD (:$request) {
    $!wccr = $request;
  }

  method WebkitGTK::Raw::Definitions::WebKitColorChooserRequest
    is also<WebKitColorChooserRequest>
  { $!wccr }

  method new (WebKitColorChooserRequest $request) {
    $request ?? self.bless(:$request) !! Nil;
  }

  # Is originally:
  # WebKitColorChooserRequest, gpointer --> void
  method finished {
    self.connect($!wccr, 'finished');
  }

  method cancel {
    webkit_color_chooser_request_cancel($!wccr);
  }

  method finish {
    webkit_color_chooser_request_finish($!wccr);
  }

  method get_element_rectangle (GdkRectangle() $rect)
    is also<get-element-rectangle>
  {
    webkit_color_chooser_request_get_element_rectangle($!wccr, $rect);
  }

  proto method get_rgba (|)
    is also<get-rgba>
  { * }

  multi method get_rgba is also<rgba> {
    my $r = GdkRGBA.new;

    die 'Could not create GdkRGBA!' unless $r;

    samewith($r);
  }
  multi method get_rgba (GdkRGBA $rgba) {
    webkit_color_chooser_request_get_rgba($!wccr, $rgba);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_color_chooser_request_get_type,
      $n,
      $t
    );
  }

  method set_rgba (GdkRGBA $rgba) is also<set-rgba> {
    webkit_color_chooser_request_set_rgba($!wccr, $rgba);
  }

}
