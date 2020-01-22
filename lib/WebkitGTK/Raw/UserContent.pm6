use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::UserContent;

sub webkit_user_style_sheet_new (
  Str $source,
  uint32 $if,           # WebKitUserContentInjectedFrames injected_frames,
  uint32 $it,           # WebKitUserScriptInjectionTime   injection_time,
  CArray[Str] $whitelist,
  CArray[Str] $blacklist
)
  returns WebKitUserStyleSheet
  is native(webkit)
  is export
  { * }

sub webkit_user_style_sheet_new_for_world (
  Str $source,
  uint32 $if,           # WebKitUserContentInjectedFrames injected_frames,
  uint32 $it,           # WebKitUserScriptInjectionTime   injection_time,
  Str $world_name,
  CArray[Str] $whitelist,
  CArray[Str] $blacklist
)
  returns WebKitUserStyleSheet
  is native(webkit)
  is export
  { * }

sub webkit_user_style_sheet_ref (WebKitUserStyleSheet $user_style_sheet)
  returns WebKitUserStyleSheet
  is native(webkit)
  is export
  { * }

sub webkit_user_style_sheet_unref (WebKitUserStyleSheet $user_style_sheet)
  is native(webkit)
  is export
  { * }

sub webkit_user_script_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_user_script_ref (WebKitUserScript $user_script)
  returns WebKitUserScript
  is native(webkit)
  is export
  { * }

sub webkit_user_script_unref (WebKitUserScript $user_script)
  is native(webkit)
  is export
  { * }

sub webkit_user_script_new (
  Str $source,
  uint32 $if,           # WebKitUserContentInjectedFrames injected_frames,
  uint32 $it,           # WebKitUserScriptInjectionTime   injection_time,
  CArray[Str] $whitelist,
  CArray[Str] $blacklist
)
  returns WebKitUserScript
  is native(webkit)
  is export
  { * }

sub webkit_user_script_new_for_world (
  Str $source,
  uint32 $if,           # WebKitUserContentInjectedFrames injected_frames,
  uint32 $it,           # WebKitUserScriptInjectionTime   injection_time,
  Str $world_name,
  CArray[Str] $whitelist,
  CArray[Str] $blacklist
)
  returns WebKitUserScript
  is native(webkit)
  is export
  { * }
