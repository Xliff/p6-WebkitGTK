use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::PolicyDecision;

use GLib::Roles::Object;

class WebkitGTK::PolicyDecision {
  also does GLib::Roles::Object;
  
  has WebKitPolicyDecision $!wpd;

  submethod BUILD (:$decision) {
    self.setPolicyDecision($decision);
  }

  method setPolicyDecision($decision) {
    self!setObject($!wpd = $decision);
  }

  method WebkitGTK::Raw::Types::WebKitPolicyDecision 
    is also<PolicyDecision> 
  { $!wpd }

  method new (WebKitPolicyDecision $decision) {
    self.bless(:$decision);
  }

  method download {
    webkit_policy_decision_download($!wpd);
  }

  method get_type is also<get-type> {
    webkit_policy_decision_get_type();
  }

  method ignore {
    webkit_policy_decision_ignore($!wpd);
  }

  method use {
    webkit_policy_decision_use($!wpd);
  }

}
