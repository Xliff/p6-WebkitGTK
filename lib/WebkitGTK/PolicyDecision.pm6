use v6.c;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PolicyDecision;

class WebkitGTK::PolicyDecision {
  has WebKitPolicyDecision $!wpd;

  submethod BUILD (:$decision) {
    $!wpd = $decision;
  }

  method WebkitGTK::Raw::Types::WebKitPolicyDecision {
    $!wpd;
  }

  method new (WebKitPolicyDecision $decision) {
    self.bless(:$decision);
  }

  method download {
    webkit_policy_decision_download($!wpd);
  }

  method get_type {
    webkit_policy_decision_get_type();
  }

  method ignore {
    webkit_policy_decision_ignore($!wpd);
  }

  method use {
    webkit_policy_decision_use($!wpd);
  }

}
