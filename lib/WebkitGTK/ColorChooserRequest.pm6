use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::ColorChooserRequest;

use GTK::Compat::RGBA;

use GTK::Roles::Signals::Generic;

class WebkitGTK::ColorChooserRequest {
  also does GTK::Roles::Signals::Generic;

  has WebKitColorChooserRequest $!wccr;

  submethod BUILD (:$request) {
    $!wccr = $request;
  }

  method WebkitGTK::Raw::Types::WebKitColorChooserRequest {
    $!wccr;
  }

  method new (WebKitColorChooserRequest $request) {
    self.bless(:$request);
  }

  # Is originally:
  # WebKitColorChooserRequest, gpointer --> void
  method finished {
    self.connect($!wccr, 'finished');
  }

  method request_cancel is also<request-cancel> {
    webkit_color_chooser_request_cancel($!wccr);
  }

  method request_finish is also<request-finish> {
    webkit_color_chooser_request_finish($!wccr);
  }

  method request_get_element_rectangle (GdkRectangle $rect)
    is also<request-get-element-rectangle>
  {
    webkit_color_chooser_request_get_element_rectangle($!wccr, $rect);
  }

  method request_get_rgba (GdkRGBA $rgba) is also<request-get-rgba> {
    webkit_color_chooser_request_get_rgba($!wccr, $rgba);
  }

  method request_get_type is also<request-get-type> {
    webkit_color_chooser_request_get_type();
  }

  method request_set_rgba (GdkRGBA $rgba) is also<request-set-rgba> {
    webkit_color_chooser_request_set_rgba($!wccr, $rgba);
  }

}
