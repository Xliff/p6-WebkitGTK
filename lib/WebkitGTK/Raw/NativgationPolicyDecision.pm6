use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::NavigationPolicyDecision;

sub webkit_navigation_policy_decision_get_frame_name (
  WebKitNavigationPolicyDecision $decision
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_navigation_policy_decision_get_navigation_action (
  WebKitNavigationPolicyDecision $decision
)
  returns uint32 # WebKitNavigationAction
  is native(webkit)
  is export
  { * }

sub webkit_navigation_policy_decision_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
