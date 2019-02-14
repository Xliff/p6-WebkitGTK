use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::AutomationSession;

sub webkit_automation_session_get_id (WebKitAutomationSession $session)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_automation_session_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_automation_session_get_application_info (
  WebKitAutomationSession $session
)
  returns WebKitApplicationInfo
  is native(webkit)
  is export
  { * }

sub webkit_automation_session_set_application_info (
  WebKitAutomationSession $session,
  WebKitApplicationInfo $info
)
  is native(webkit)
  is export
  { * }
