use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WindowProperties;

sub webkit_window_properties_get_fullscreen (
  WebKitWindowProperties $window_properties
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_geometry (
  WebKitWindowProperties $window_properties,
  GdkRectangle $geometry
)
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_locationbar_visible (
  WebKitWindowProperties $window_properties
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_menubar_visible (
  WebKitWindowProperties $window_properties
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_resizable (
  WebKitWindowProperties $window_properties
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_scrollbars_visible (
  WebKitWindowProperties $window_properties
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_statusbar_visible (
  WebKitWindowProperties $window_properties
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_toolbar_visible (
  WebKitWindowProperties $window_properties
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_window_properties_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
