use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::UserContentManager;

sub webkit_user_content_manager_add_script (
  WebKitUserContentManager $manager,
  WebKitUserScript $script
)
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_add_style_sheet (
  WebKitUserContentManager $manager,
  WebKitUserStyleSheet $stylesheet
)
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_new ()
  returns WebKitUserContentManager
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_register_script_message_handler (
  WebKitUserContentManager $manager,
  Str $name
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_register_script_message_handler_in_world (
  WebKitUserContentManager $manager,
  Str $name,
  Str $world_name
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_remove_all_scripts (
  WebKitUserContentManager $manager
)
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_remove_all_style_sheets (
  WebKitUserContentManager $manager
)
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_unregister_script_message_handler (
  WebKitUserContentManager $manager,
  Str $name
)
  is native(webkit)
  is export
  { * }

sub webkit_user_content_manager_unregister_script_message_handler_in_world (
  WebKitUserContentManager $manager,
  Str $name,
  Str $world_name
)
  is native(webkit)
  is export
  { * }
