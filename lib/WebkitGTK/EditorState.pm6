use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::EditorState;

class WebkitGTK::EditorState {
  has WebKitEditorState $!wes;

  submethod BUILD (:$state) {
    $!wes = $state;
  }

  method WebkitGTK::Raw::Types::WebKitEditorState {
    $!wes;
  }

  method new (WebKitEditorState $state) {
    self.bless(:$state);
  }

  method get_type {
    webkit_editor_state_get_type();
  }

  method get_typing_attributes {
    webkit_editor_state_get_typing_attributes($!wes);
  }

  method is_copy_available {
    so webkit_editor_state_is_copy_available($!wes);
  }

  method is_cut_available {
    so webkit_editor_state_is_cut_available($!wes);
  }

  method is_paste_available {
    so webkit_editor_state_is_paste_available($!wes);
  }

  method is_redo_available {
    so webkit_editor_state_is_redo_available($!wes);
  }

  method is_undo_available {
    so webkit_editor_state_is_undo_available($!wes);
  }

}
