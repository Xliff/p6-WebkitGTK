use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::PolicyDecision;

sub webkit_policy_decision_download (WebKitPolicyDecision $decision)
  is native(webkit)
  is export
  { * }

sub webkit_policy_decision_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_policy_decision_ignore (WebKitPolicyDecision $decision)
  is native(webkit)
  is export
  { * }

sub webkit_policy_decision_use (WebKitPolicyDecision $decision)
  is native(webkit)
  is export
  { * }
