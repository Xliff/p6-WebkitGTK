use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::ResponsePolicyDecision;

use WebkitGTK::PolicyDecision;
use WebkitGTK::URIResponse;
use WebkitGTK::URIRequest;

my subset PolicyDecisionAncestry is export
  where WebKitResponsePolicyDecision | WebKitPolicyDecision;

class WebkitGTK::ResponsePolicyDecision is WebkitGTK::PolicyDecision {
  has WebKitResponsePolicyDecision $!wrpd;

  submethod BUILD (:$policy-decision is copy) {
    my $to_parent;
    $!wrpd = do given $policy-decision {
      when WebKitPolicyDecision {
        $to_parent = $_;
        cast(WebKitResponsePolicyDecision, $_);
      }
      when WebKitResponsePolicyDecision {
        $to_parent = cast(WebKitPolicyDecision, $_);
        $_;
      }
    }
    self.setPolicyDecision($to_parent);
  }

  method new (PolicyDecisionAncestry $policy-decision) {
    $policy-decision ?? self.bless(:$policy-decision) !! Nil;
  }

  method get_request (:$raw = False) is also<get-request> {
    my $r = webkit_response_policy_decision_get_request($!wrpd);

    $r ??
      ( $raw ?? $r !! WebkitGTK::URIRequest.new($r) )
      !!
      Nil;
  }

  method get_response (:$raw = False) is also<get-response> {
    my $r = webkit_response_policy_decision_get_response($!wrpd);

    $r ??
      ( $raw ?? $r !! WebkitGTK::URIRequest.new($r) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_response_policy_decision_get_type,
      $n,
      $t
    );
  }

  method is_mime_type_supported is also<is-mime-type-supported> {
    so webkit_response_policy_decision_is_mime_type_supported($!wrpd);
  }
}
