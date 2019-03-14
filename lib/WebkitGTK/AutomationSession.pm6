use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::AutomationSession;

use WebkitGTK::ApplicationInfo;

use WebkitGTK::Roles::Signals::AutomationSession;

class WebkitGTK::AutomationSession {
  also does WebkitGTK::Roles::Signals::AutomationSession;

  has WebKitAutomationSession $!was;

  submethod BUILD (:$session) {
    $!was = $session;
  }

  submethod DESTROY {
    self.disconnect-all($_) for %!signals-was;
  }

  method new (WebKitAutomationSession $session) {
    self.bless(:$session);
  }

  method application_info is rw is also<application-info> {
    Proxy.new(
      FETCH => sub ($) {
        WebkitGTK::ApplicationInfo.new(
          webkit_automation_session_get_application_info($!was)
        );
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
    webkit_automation_session_get_type();
  }

}