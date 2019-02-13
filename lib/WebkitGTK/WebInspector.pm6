use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebInspector;

use GTK::Roles::Signals::Generic;

class WebkitGTK::WebInspector {
  also does GTK::Roles::Signals::Generic;

  has WebKitWebInspector $!wwi;

  submethod BUILD (:$inspector) {
    $!wwi = $inspector;
  }

  method new (WebKitWebInspector $inspector) {
    self.bless(:$inspector);
  }

  # Is originally:
  # WebKitWebInspector, gpointer --> gboolean
  method attach {
    self.connect-rbool($!wwi, 'attach');
  }

  # Is originally:
  # WebKitWebInspector, gpointer --> gboolean
  method bring-to-front {
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
  method open-window {
    self.connect-rbool($!wwi, 'open-window');
  }

  method attach-emit {
    webkit_web_inspector_attach($!wwi);
  }

  method close {
    webkit_web_inspector_close($!wwi);
  }

  method detach-emit {
    webkit_web_inspector_detach($!wwi);
  }

  method get_attached_height {
    webkit_web_inspector_get_attached_height($!wwi);
  }

  method get_can_attach {
    so webkit_web_inspector_get_can_attach($!wwi);
  }

  method get_inspected_uri {
    webkit_web_inspector_get_inspected_uri($!wwi);
  }

  method get_type {
    webkit_web_inspector_get_type();
  }

  method get_web_view {
    ::('WebkitGTK::WebView').new(
      webkit_web_inspector_get_web_view($!wwi)
    );
  }

  method is_attached {
    so webkit_web_inspector_is_attached($!wwi);
  }

  method show {
    webkit_web_inspector_show($!wwi);
  }

}
