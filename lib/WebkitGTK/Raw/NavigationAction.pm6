use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::NavigationAction;

sub webkit_navigation_action_copy (WebKitNavigationAction $navigation)
  returns WebKitNavigationAction
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_free (WebKitNavigationAction $navigation)
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_get_modifiers (
  WebKitNavigationAction $navigation
)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_get_mouse_button (
  WebKitNavigationAction $navigation
)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_get_navigation_type (
  WebKitNavigationAction $navigation
)
  returns guint # WebKitNavigationType
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_get_request (
  WebKitNavigationAction $navigation
)
  returns WebKitURIRequest
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_is_redirect (
  WebKitNavigationAction $navigation
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_navigation_action_is_user_gesture (
  WebKitNavigationAction $navigation
)
  returns uint32
  is native(webkit)
  is export
  { * }
