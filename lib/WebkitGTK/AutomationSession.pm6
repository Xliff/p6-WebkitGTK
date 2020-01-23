use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::AutomationSession;

use WebkitGTK::ApplicationInfo;

use GLib::Roles::Object;
use WebkitGTK::Roles::Signals::AutomationSession;

class WebkitGTK::AutomationSession {
  also does GLib::Roles::Object;
  also does WebkitGTK::Roles::Signals::AutomationSession;

  has WebKitAutomationSession $!was is implementor;

  submethod BUILD (:$session) {
    $!was = $session;

    self.roleInit-Object;
  }

  submethod DESTROY {
    self.disconnect-all($_) for %!signals-was;
  }

  method new (WebKitAutomationSession $session) {
    $session ?? self.bless(:$session) !! Nil;
  }

  method application_info (:$raw = False) is rw is also<application-info> {
    Proxy.new(
      FETCH => sub ($) {
        my $ai = webkit_automation_session_get_application_info($!was);

        $ai ??
          ( $raw ?? $ai !! WebkitGTK::ApplicationInfo.new($ai) )
          !!
          Nil;
      },
      STORE => sub ($, WebKitApplicationInfo() $info is copy) {
        webkit_automation_session_set_application_info($!was, $info);
      }
    );
  }

  # Is originally:
  # WebKitAutomationSession, gpointer --> WebKitWebView
  method create-web-view is also<create_web_view> {
    self.connect-create-web-view($!was);
  }

  method get_id is also<get-id> {
    webkit_automation_session_get_id($!was);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_automation_session_get_type,
      $n,
      $t
    );
  }

}
