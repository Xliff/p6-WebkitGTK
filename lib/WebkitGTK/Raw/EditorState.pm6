use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::EditorState;

sub webkit_editor_state_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_editor_state_get_typing_attributes (WebKitEditorState $editor_state)
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_editor_state_is_copy_available (WebKitEditorState $editor_state)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_editor_state_is_cut_available (WebKitEditorState $editor_state)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_editor_state_is_paste_available (WebKitEditorState $editor_state)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_editor_state_is_redo_available (WebKitEditorState $editor_state)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_editor_state_is_undo_available (WebKitEditorState $editor_state)
  returns uint32
  is native(webkit)
  is export
  { * }
