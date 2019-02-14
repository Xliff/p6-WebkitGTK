use v6.c;

use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::NavigationPolicyDecision;

use WebkitGTK::PolicyDecision;
use WebkitGTK::NavigationAction;

my subset Ancestry where WebKitNavigationPolicyDecision | WebKitPolicyDecision;

class WebkitGTK::NavigationPolicyDecision is WebkitGTK::PolicyDecision {
  has WebKitNavigationPolicyDecision $!wnpd;

  submethod BUILD (:$decision) {
    my $to_parent;
    $!wnpd = do given $decision {
      when WebKitPolicyDecision {
        $to_parent = $_;
        nativecast(WebKitNavigationPolicyDecision, $_);
      }
      when WebKitNavigationPolicyDecision {
        $to_parent = nativecast(WebKitPolicyDecision, $_);
        $_;
      }
    }
    self.setPolicyDecision($to_parent);
  }

  method new (Ancestry $decision) {
    self.bless(:$decision);
  }

  method get_frame_name {
    webkit_navigation_policy_decision_get_frame_name($!wnpd);
  }

  method get_navigation_action {
    WebkitGTK::NavigationAction.new(
      webkit_navigation_policy_decision_get_navigation_action($!wnpd)
    );
  }

  method get_type {
    webkit_navigation_policy_decision_get_type();
  }
}
