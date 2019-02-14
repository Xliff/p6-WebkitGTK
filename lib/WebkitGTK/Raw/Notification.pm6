use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::Notification;

sub webkit_notification_clicked (WebKitNotification $notification)
  is native(webkit)
  is export
  { * }

sub webkit_notification_close (WebKitNotification $notification)
  is native(webkit)
  is export
  { * }

sub webkit_notification_get_body (WebKitNotification $notification)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_notification_get_id (WebKitNotification $notification)
  returns guint64
  is native(webkit)
  is export
  { * }

sub webkit_notification_get_tag (WebKitNotification $notification)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_notification_get_title (WebKitNotification $notification)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_notification_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
