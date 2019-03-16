use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::Frame;

sub webkit_frame_get_js_context (WebKitFrame $frame)
  returns JSCContext
  is native(webkit)
  is export
  { * }

sub webkit_frame_get_js_context_for_script_world (
  WebKitFrame $frame, 
  WebKitScriptWorld $world
)
  returns JSCContext
  is native(webkit)
  is export
  { * }

# sub webkit_frame_get_js_value_for_dom_object (
#   WebKitFrame $frame, 
#   WebKitDOMObject $dom_object
# )
#   returns JSCValue
#   is native(webkit)
#   is export
#   { * }
# 
# sub webkit_frame_get_js_value_for_dom_object_in_script_world (
#   WebKitFrame $frame, 
#   WebKitDOMObject $dom_object, 
#   WebKitScriptWorld $world
# )
#   returns JSCValue
#   is native(webkit)
#   is export
#   { * }

sub webkit_frame_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_frame_get_uri (WebKitFrame $frame)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_frame_is_main_frame (WebKitFrame $frame)
  returns uint32
  is native(webkit)
  is export
  { * }
