use v6.c;

use Method::Also;
use NativeCall;

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

  method get_modifiers is also<get-modifiers> {
    webkit_navigation_action_get_modifiers($!wna);
  }

  method get_mouse_button is also<get-mouse-button> {
    webkit_navigation_action_get_mouse_button($!wna);
  }

  method get_navigation_type is also<get-navigation-type> {
    webkit_navigation_action_get_navigation_type($!wna);
  }

  method get_request is also<get-request> {
    webkit_navigation_action_get_request($!wna);
  }

  method get_type is also<get-type> {
    webkit_navigation_action_get_type();
  }

  method is_redirect is also<is-redirect> {
    so webkit_navigation_action_is_redirect($!wna);
  }

  method is_user_gesture is also<is-user-gesture> {
    so webkit_navigation_action_is_user_gesture($!wna);
  }

}

