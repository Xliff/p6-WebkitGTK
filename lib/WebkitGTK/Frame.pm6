use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Frame;

use WebkitGTK::JavaScript::Context;

use GLib::Roles::Object;

class WebkitGTK::Frame {
  also does GLib::Roles::Object;

  has WebKitFrame $!wf is implementor;

  submethod BUILD (:$frame) {
    $!wf = $frame;

    self.roleInit-Object;
  }

  method get_js_context (:$raw = False) is also<get-js-context> {
    my $jc = webkit_frame_get_js_context($!wf);

    $jc ??
      ( $raw ?? $jc !! WebkitGTK::JavaScript::Context.new($jc) )
      !!
      Nil;
  }

  method get_js_context_for_script_world (
    WebKitScriptWorld() $world,
    :$raw = False
  )
    is also<get-js-context-for-script-world>
  {
    my $jc = webkit_frame_get_js_context_for_script_world($!wf, $world);

    $jc ??
      ( $raw ?? $jc !! WebkitGTK::JavaScript::Context.new($jc) )
      !!
      Nil;
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

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_frame_get_type, $n, $t );
  }

  method get_uri is also<get-uri> {
    webkit_frame_get_uri($!wf);
  }

  method is_main_frame is also<is-main-frame> {
    so webkit_frame_is_main_frame($!wf);
  }

}
