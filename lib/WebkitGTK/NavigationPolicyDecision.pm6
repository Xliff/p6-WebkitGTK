use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::NavigationPolicyDecision;

use WebkitGTK::PolicyDecision;
use WebkitGTK::NavigationAction;

our subset NavigationPolicyDecisionAncestry is export
  where WebKitNavigationPolicyDecision | WebKitPolicyDecision;

class WebkitGTK::NavigationPolicyDecision is WebkitGTK::PolicyDecision {
  has WebKitNavigationPolicyDecision $!wnpd;

  submethod BUILD (:$nav-decision) {
    my $to_parent;
    $!wnpd = do given $nav-decision {
      when WebKitPolicyDecision {
        $to_parent = $_;
        cast(WebKitNavigationPolicyDecision, $_);
      }
      when WebKitNavigationPolicyDecision {
        $to_parent = cast(WebKitPolicyDecision, $_);
        $_;
      }
    }
    self.setPolicyDecision($to_parent);
  }

  method new (NavigationPolicyDecisionAncestry $nav-decision) {
    $nav-decision ?? self.bless(:$nav-decision) !! Nil;
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

  method get_navigation_action (:$raw = False)
    is also<
      get-navigation-action
      navigation_action
      navigation-action
    >
  {
    my $na = webkit_navigation_policy_decision_get_navigation_action($!wnpd);

    $na ??
      ( $raw ?? $na !! WebkitGTK::NavigationAction.new($na) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_navigation_policy_decision_get_type,
      $n,
      $t
    );
  }

}
