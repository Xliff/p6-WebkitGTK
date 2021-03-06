use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Notification;

use GLib::Roles::Object;

use GLib::Roles::Signals::Generic;

class WebkitGTK::Notification {
  also does GLib::Roles::Object;
  also does GLib::Roles::Signals::Generic;

  has WebKitNotification $!wn;

  submethod BUILD (:$notice) {
    self!setObject($!wn = $notice);
  }

  method WebkitGTK::Raw::Definitions::WebKitNotification
    is also<WebKitNotification>
  { $!wn }

  method new (WebKitNotification $notice) {
    $notice ?? self.bless(:$notice) !! Nil;
  }

  # WebKitNotification, gpointer --> void
  method clicked {
    self.connect($!wn, 'clicked');
  }

  # WebKitNotification, gpointer --> void
  method closed {
    self.connect($!wn, 'closed');
  }

  method emit-clicked is also<emit_clicked> {
    webkit_notification_clicked($!wn);
  }

  method close {
    webkit_notification_close($!wn);
  }

  method get_body
    is also<
      get-body
      body
    >
  {
    webkit_notification_get_body($!wn);
  }

  method get_id
    is also<
      get-id
      id
    >
  {
    webkit_notification_get_id($!wn);
  }

  method get_tag
    is also<
      get-tag
      tag
    >
  {
    webkit_notification_get_tag($!wn);
  }

  method get_title
    is also<
      get-title
      title
    >
  {
    webkit_notification_get_title($!wn);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_notification_get_type,
      $n,
      $t
    );
  }

}
