use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WebInspector;

sub webkit_web_inspector_attach (WebKitWebInspector $inspector)
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_close (WebKitWebInspector $inspector)
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_detach (WebKitWebInspector $inspector)
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_get_attached_height (WebKitWebInspector $inspector)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_get_can_attach (WebKitWebInspector $inspector)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_get_inspected_uri (WebKitWebInspector $inspector)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_get_web_view (WebKitWebInspector $inspector)
  returns WebKitWebView
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_is_attached (WebKitWebInspector $inspector)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_inspector_show (WebKitWebInspector $inspector)
  is native(webkit)
  is export
  { * }
