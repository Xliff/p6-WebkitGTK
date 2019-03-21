use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::ConsoleMessage;

sub webkit_console_message_copy (WebKitConsoleMessage $console_message)
  returns WebKitConsoleMessage
  is native(webkit)
  is export
  { * }

sub webkit_console_message_free (WebKitConsoleMessage $console_message)
  is native(webkit)
  is export
  { * }

sub webkit_console_message_get_level (
  WebKitConsoleMessage $console_message
)
  returns uint32 # WebKitConsoleMessageLevel
  is native(webkit)
  is export
  { * }

sub webkit_console_message_get_line (WebKitConsoleMessage $console_message)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_console_message_get_source (WebKitConsoleMessage $console_message)
  returns uint32 # WebKitConsoleMessageSource
  is native(webkit)
  is export
  { * }

sub webkit_console_message_get_source_id (
  WebKitConsoleMessage $console_message
)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_console_message_get_text (WebKitConsoleMessage $console_message)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_console_message_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
