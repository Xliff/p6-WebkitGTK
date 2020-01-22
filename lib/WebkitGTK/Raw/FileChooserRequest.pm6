use v6.c;

use NativeCall;



use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::FileChooserReqeust;

sub webkit_file_chooser_request_cancel (WebKitFileChooserRequest $request)
  is native(webkit)
  is export
  { * }

sub webkit_file_chooser_request_get_mime_types_filter (
  WebKitFileChooserRequest $request
)
  returns GtkFileFilter
  is native(webkit)
  is export
  { * }

sub webkit_file_chooser_request_get_select_multiple (
  WebKitFileChooserRequest $request
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_file_chooser_request_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_file_chooser_request_get_selected_files (
  WebKitFileChooserRequest $request
)
  returns CArray[Str]
  is native(webkit)
  is export
  { * }

sub webkit_file_chooser_request_select_files (
  WebKitFileChooserRequest $request,
  CArray[Str] $files
)
  is native(webkit)
  is export
  { * }
