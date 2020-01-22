use v6.c;

use Method::Also;
use NativeCall;


use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::EditorState;

class WebkitGTK::EditorState {
  has WebKitEditorState $!wes;

  submethod BUILD (:$state) {
    $!wes = $state;
  }

  method WebkitGTK::Raw::Definitions::WebKitEditorState {
    $!wes;
  }

  method new (WebKitEditorState $state) {
    self.bless(:$state);
  }

  method get_type is also<get-type> {
    webkit_editor_state_get_type();
  }

  method get_typing_attributes is also<get-typing-attributes> {
    webkit_editor_state_get_typing_attributes($!wes);
  }

  method is_copy_available is also<is-copy-available> {
    so webkit_editor_state_is_copy_available($!wes);
  }

  method is_cut_available is also<is-cut-available> {
    so webkit_editor_state_is_cut_available($!wes);
  }

  method is_paste_available is also<is-paste-available> {
    so webkit_editor_state_is_paste_available($!wes);
  }

  method is_redo_available is also<is-redo-available> {
    so webkit_editor_state_is_redo_available($!wes);
  }

  method is_undo_available is also<is-undo-available> {
    so webkit_editor_state_is_undo_available($!wes);
  }

}

