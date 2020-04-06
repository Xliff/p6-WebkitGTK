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

  method WebkitGTK::Raw::Definitions::WebKitPolicyDecision
    is also<
      PolicyDecision
      WebKitPolicyDecision
    >
  { $!wpd }

  method new (WebKitPolicyDecision $decision) {
    $decision ?? self.bless(:$decision) !! Nil;
  }

  method download {
    webkit_policy_decision_download($!wpd);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_policy_decision_get_type,
      $n,
      $t
    );
  }

  method ignore {
    webkit_policy_decision_ignore($!wpd);
  }

  method use {
    webkit_policy_decision_use($!wpd);
  }

}
