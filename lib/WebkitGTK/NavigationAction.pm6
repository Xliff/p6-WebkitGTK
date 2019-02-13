use v6.c;

use NativeCall

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::NavigationAction;

class WebkitGTK::NavigationAction {
  has WebKitNavigationAction $!wna;

  submethod BUILD (:$action) {
    $!wna = $action;
  }

  method WebkitGTK::Raw::Types::WebKitNavigationAction {
    $!wna;
  }

  method new (WebKitNavigationAction $action) {
    self.bless(:$action);
  }

  method copy {
    self.bless( action => webkit_navigation_action_copy($!wna) )
  }

  method free {
    webkit_navigation_action_free($!wna);
  }

  method get_modifiers {
    webkit_navigation_action_get_modifiers($!wna);
  }

  method get_mouse_button {
    webkit_navigation_action_get_mouse_button($!wna);
  }

  method get_navigation_type {
    webkit_navigation_action_get_navigation_type($!wna);
  }

  method get_request {
    webkit_navigation_action_get_request($!wna);
  }

  method get_type {
    webkit_navigation_action_get_type();
  }

  method is_redirect {
    so webkit_navigation_action_is_redirect($!wna);
  }

  method is_user_gesture {
    so webkit_navigation_action_is_user_gesture($!wna);
  }

}
