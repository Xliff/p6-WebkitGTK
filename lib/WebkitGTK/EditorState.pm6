use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::EditorState;

use GLib::Roles::Object;

class WebkitGTK::EditorState {
  also does GLib::Roles::Object;

  has WebKitEditorState $!wes is implementor;

  submethod BUILD (:$state) {
    $!wes = $state;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitEditorState
    is also<WebKitEditorState>
  { $!wes }

  method new (WebKitEditorState $state) {
    $state ?? self.bless(:$state) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_editor_state_get_type, $n, $t );
  }

  method get_typing_attributes is also<get-typing-attributes> {
    # Flags
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
