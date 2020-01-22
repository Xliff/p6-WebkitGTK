use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::Frame;

class WebkitGTK::Frame {
  has WebKitFrame $!wf;
  
  submethod BUILD (:$frame) {
    $!wf = $frame;
  }
  
  method get_js_context {
    webkit_frame_get_js_context($!wf);
  }

  method get_js_context_for_script_world (
    WebKitScriptWorld $world
  ) {
    webkit_frame_get_js_context_for_script_world($!wf, $world);
  }

  # method get_js_value_for_dom_object (
  #   WebKitDOMObject $dom_object
  # ) {
  #   webkit_frame_get_js_value_for_dom_object($!wf, $dom_object);
  # }
  # 
  # method get_js_value_for_dom_object_in_script_world (
  #   WebKitDOMObject $dom_object, 
  #   WebKitScriptWorld $world
  # ) {
  #   webkit_frame_get_js_value_for_dom_object_in_script_world(
  #     $!wf, $dom_object, $world
  #   );
  # }

  method get_type {
    webkit_frame_get_type();
  }

  method get_uri {
    webkit_frame_get_uri($!wf);
  }

  method is_main_frame {
    webkit_frame_is_main_frame($!wf);
  }

}
