use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::FileChooserRequest;

use GTK::FileFilter;

use GLib::Roles::Object;

class WekkitGTK::FileChooserRequest {
  also does GLib::Roles::Object;

  has WebKitFileChooserRequest $!wfcr is implementor;

  submethod BUILD (:$request) {
    $!wfcr = $request;

    self.roleInit-Object;
  }

  method new (WebKitFileChooserRequest $request) {
    $request ?? self.bless(:$request) !! Nil;
  }

  method cancel {
    webkit_file_chooser_request_cancel($!wfcr);
  }

  method get_mime_types_filter (:$raw = False)
    is also<get-mime-types-filter>
  {
    my $ff = webkit_file_chooser_request_get_mime_types_filter($!wfcr);

    $ff ??
      ( $raw ?? $ff !! GTK::FileFilter.new($ff) )
      !!
      Nil;
  }

  method get_select_multiple is also<get-select-multiple> {
    so webkit_file_chooser_request_get_select_multiple($!wfcr);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_file_chooser_request_get_type,
      $n,
      $t
    );
  }

  proto method select_files (|)
    is also<select-files>
  { * }

  multi method select_files (@files)  {
    samewith( ArrayToCArray(Str, @files) );
  }
  multi method select_files (CArray[Str] $files) {
    webkit_file_chooser_request_select_files($!wfcr, $files);
  }

  multi method get_selected_files is also<get-selected-files> {
    my $sf = webkit_file_chooser_request_get_selected_files($!wfcr);

    $sf ?? CStringArrayToArray($sf) !! Nil;
  }

}
