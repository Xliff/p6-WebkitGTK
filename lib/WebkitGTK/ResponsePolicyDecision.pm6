use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::ResponsePolicyDecision;

use WebkitGTK::PolicyDecision;
use WebkitGTK::URIResponse;
use WebkitGTK::URIRequest;

my subset Ancestry where WebKitResponsePolicyDecision | WebKitPolicyDecision;

class WebkitGTK::ResponsePolicyDecision is WebkitGTK::PolicyDecision {
  has WebKitResponsePolicyDecision $!wrpd;

  submethod BUILD (:$decision is copy) {
    my $to_parent;
    $!wrpd = do given $decision {
      when WebKitPolicyDecision {
        $to_parent = $_;
        nativecast(WebKitResponsePolicyDecision, $_);
      }
      when WebKitResponsePolicyDecision {
        $to_parent = nativecast(WebKitPolicyDecision, $_);
        $_;
      }
    }
    self.setPolicyDecision($to_parent);
  }

  method new (Ancestry $decision) {
    self.bless(:$decision);
  }

  method get_request is also<get-request> {
    WebkitGTK::URIRequest.new(
      webkit_response_policy_decision_get_request($!wrpd)
    );
  }

  method get_response is also<get-response> {
    WebkitGTK::URIResponse.new(
      webkit_response_policy_decision_get_response($!wrpd)
    );
  }

  method get_type is also<get-type> {
    webkit_response_policy_decision_get_type();
  }

  method is_mime_type_supported is also<is-mime-type-supported> {
    so webkit_response_policy_decision_is_mime_type_supported($!wrpd);
  }
}

