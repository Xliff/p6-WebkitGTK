use v6.c;

use Method::Also;


use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::ConsoleMessage;

class WebkitGTK::ConsoleMessage {
  has WebKitConsoleMessage $!wcm;

  submethod BUILD (:$message) {
    $!wcm = $message;
  }

  method new (WebKitConsoleMessage $message) {
    self.bless( message => $message );
  }

  method copy {
    self.bless( message => webkit_console_message_copy($!wcm) );
  }

  method free {
    webkit_console_message_free($!wcm);
  }

  method get_level is also<get-level> {
    webkit_console_message_get_level($!wcm);
  }

  method get_line is also<get-line> {
    webkit_console_message_get_line($!wcm);
  }

  method get_source is also<get-source> {
    webkit_console_message_get_source($!wcm);
  }

  method get_source_id is also<get-source-id> {
    webkit_console_message_get_source_id($!wcm);
  }

  method get_text is also<get-text> {
    webkit_console_message_get_text($!wcm);
  }

  method get_type is also<get-type> {
    webkit_console_message_get_type();
  }

}
