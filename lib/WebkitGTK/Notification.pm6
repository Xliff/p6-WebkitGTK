use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Notification;

use GTK::Roles::Signals::Generic;

class WebkitGTK::Notification {
  has WebKitNotification $!wn;

  submethod BUILD (:$notice) {
    $!wn = $notice;
  }

  method new (WebKitNotification $notice) {
    self.bless(:$notice);
  }

  # WebKitNotification, gpointer --> void
  method clicked {
    self.connect($!wn, 'clicked');
  }

  # WebKitNotification, gpointer --> void
  method closed {
    self.connect($!wn, 'closed');
  }

  method emit-clicked {
    webkit_notification_clicked($!wn);
  }

  method close {
    webkit_notification_close($!wn);
  }

  method get_body {
    webkit_notification_get_body($!wn);
  }

  method get_id {
    webkit_notification_get_id($!wn);
  }

  method get_tag {
    webkit_notification_get_tag($!wn);
  }

  method get_title {
    webkit_notification_get_title($!wn);
  }

  method get_type {
    webkit_notification_get_type();
  }

}
