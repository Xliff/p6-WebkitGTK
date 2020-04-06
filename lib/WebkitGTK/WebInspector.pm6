use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebInspector;

use GLib::Roles::Object;
use GLib::Roles::Signals::Generic;

class WebkitGTK::WebInspector {
  also does GLib::Roles::Object;
  also does GLib::Roles::Signals::Generic;

  has WebKitWebInspector $!wwi is implementor;

  submethod BUILD (:$inspector) {
    $!wwi = $inspector;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitWebInspector
    is also<WebKitWebInspector>
  { $!wwi }

  method new (WebKitWebInspector $inspector) {
    $inspector ?? self.bless(:$inspector) !! Nil;
  }

  # Is originally:
  # WebKitWebInspector, gpointer --> gboolean
  method attach {
    self.connect-rbool($!wwi, 'attach');
  }

  # Is originally:
  # WebKitWebInspector, gpointer --> gboolean
  method bring-to-front is also<bring_to_front> {
    self.connect-rbool($!wwi, 'bring-to-front');
  }

  # Is originally:
  # WebKitWebInspector, gpointer --> void
  method closed {
    self.connect($!wwi, 'closed');
  }

  # Is originally:
  # WebKitWebInspector, gpointer --> gboolean
  method detach {
    self.connect-rbool($!wwi, 'detach');
  }

  # Is originally:
  # WebKitWebInspector, gpointer --> gboolean
  method open-window is also<open_window> {
    self.connect-rbool($!wwi, 'open-window');
  }

  method emit_attach is also<emit-attach> {
    webkit_web_inspector_attach($!wwi);
  }

  method close {
    webkit_web_inspector_close($!wwi);
  }

  method emit_detach is also<emit-detach> {
    webkit_web_inspector_detach($!wwi);
  }

  method get_attached_height is also<get-attached-height> {
    webkit_web_inspector_get_attached_height($!wwi);
  }

  method get_can_attach is also<get-can-attach> {
    so webkit_web_inspector_get_can_attach($!wwi);
  }

  method get_inspected_uri is also<get-inspected-uri> {
    webkit_web_inspector_get_inspected_uri($!wwi);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_web_inspector_get_type, $n, $t );
  }

  method get_web_view is also<get-web-view> {
    ::('WebkitGTK::WebView').new(
      webkit_web_inspector_get_web_view($!wwi)
    );
  }

  method is_attached is also<is-attached> {
    so webkit_web_inspector_is_attached($!wwi);
  }

  method show {
    webkit_web_inspector_show($!wwi);
  }

}
