use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::NavigationPolicyDecision;

use WebkitGTK::PolicyDecision;
use WebkitGTK::NavigationAction;

our subset NavigationPolicyDecisionAncestry is export 
  where WebKitNavigationPolicyDecision | WebKitPolicyDecision;

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

  method new (NavigationPolicyDecisionAncestry $decision) {
    self.bless(:$decision);
  }

  method get_frame_name 
    is also<
      get-frame-name
      frame_name
      frame-name
    > 
  {
    webkit_navigation_policy_decision_get_frame_name($!wnpd);
  }

  method get_navigation_action 
    is also<
      get-navigation-action
      navigation_action
      navigation-action
    > 
  {
    WebkitGTK::NavigationAction.new(
      webkit_navigation_policy_decision_get_navigation_action($!wnpd)
    );
  }

  method get_type is also<get-type> {
    webkit_navigation_policy_decision_get_type();
  }
}
