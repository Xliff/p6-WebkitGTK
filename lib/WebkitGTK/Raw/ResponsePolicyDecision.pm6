use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::ResponsePolicyDecision;

sub webkit_response_policy_decision_get_request (WebKitResponsePolicyDecision $decision)
  returns WebKitURIRequest
  is native(webkit)
  is export
  { * }

sub webkit_response_policy_decision_get_response (WebKitResponsePolicyDecision $decision)
  returns WebKitURIResponse
  is native(webkit)
  is export
  { * }

sub webkit_response_policy_decision_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_response_policy_decision_is_mime_type_supported (WebKitResponsePolicyDecision $decision)
  returns uint32
  is native(webkit)
  is export
  { * }
