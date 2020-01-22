use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::Plugin;

sub webkit_plugin_get_description (WebKitPlugin $plugin)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_plugin_get_mime_info_list (WebKitPlugin $plugin)
  returns GList
  is native(webkit)
  is export
  { * }

sub webkit_plugin_get_name (WebKitPlugin $plugin)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_plugin_get_path (WebKitPlugin $plugin)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_plugin_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }
