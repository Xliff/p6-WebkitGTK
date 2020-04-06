use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::NavigationAction;

use WebkitGTK::URIRequest;

# BOXED TYPE

class WebkitGTK::NavigationAction {
  has WebKitNavigationAction $!wna;

  submethod BUILD (:$action) {
    $!wna = $action;
  }

  method WebkitGTK::Raw::Definitions::WebKitNavigationAction
    is also<
      NavigationAction
      WebKitNavigationAction
    >
  { $!wna }

  method new (WebKitNavigationAction $action) {
    $action ?? self.bless(:$action) !! Nil;
  }

  method copy (:$raw = False) {
    my $c = webkit_navigation_action_copy($!wna);

    $c ??
      ( $raw ?? $c !! WebkitGTK::NavigationAction.new($c) )
      !!
      Nil;
  }

  method free {
    webkit_navigation_action_free($!wna);
  }

  method get_modifiers
    is also<
      get-modifiers
      modifiers
    >
  {
    webkit_navigation_action_get_modifiers($!wna);
  }

  method get_mouse_button
    is also<
      get-mouse-button
      mouse_button
      mouse-button
    >
  {
    webkit_navigation_action_get_mouse_button($!wna);
  }

  method get_navigation_type
    is also<
      get-navigation-type
      navigation_type
      navigation-type
    >
  {
    WebKitNavigationTypeEnum(
      webkit_navigation_action_get_navigation_type($!wna)
    );
  }

  method get_request (:$raw = False)
    is also<
      get-request
      request
    >
  {
    my $r = webkit_navigation_action_get_request($!wna);

    $r ??
      ( $raw ?? $r !! WebkitGTK::URIRequest.new($r) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_navigation_action_get_type,
      $n,
      $t
    );
  }

  method is_redirect is also<is-redirect> {
    so webkit_navigation_action_is_redirect($!wna);
  }

  method is_user_gesture is also<is-user-gesture> {
    so webkit_navigation_action_is_user_gesture($!wna);
  }

}
