use v6.c;

use NativeCall;



use WebkitGTK::Raw::Types;

use GTK::Compat::RGBA;

unit package WebkitGTK::Raw::ColorChooserRequest;

sub webkit_color_chooser_request_cancel (WebKitColorChooserRequest $request)
  is native(webkit)
  is export
  { * }

sub webkit_color_chooser_request_finish (WebKitColorChooserRequest $request)
  is native(webkit)
  is export
  { * }

sub webkit_color_chooser_request_get_element_rectangle (
  WebKitColorChooserRequest $request,
  GdkRectangle $rect
)
  is native(webkit)
  is export
  { * }

sub webkit_color_chooser_request_get_rgba (
  WebKitColorChooserRequest $request,
  GdkRGBA $rgba
)
  is native(webkit)
  is export
  { * }

sub webkit_color_chooser_request_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_color_chooser_request_set_rgba (
  WebKitColorChooserRequest $request,
  GdkRGBA $rgba
)
  is native(webkit)
  is export
  { * }
