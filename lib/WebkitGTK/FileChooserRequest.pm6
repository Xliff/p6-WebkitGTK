use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::FileChooserRequest;

use GTK::FileFilter;

class WekkitGTK::FileChooserRequest {
  has WebKitFileChooserRequest $!wfcr;

  submethod BUILD (:$request) {
    $!wfcr = $request;
  }

  method new (WebKitFileChooserRequest $request) {
    self.bless(:$request);
  }

  method cancel {
    webkit_file_chooser_request_cancel($!wfcr);
  }

  method get_mime_types_filter {
    GTK::FileFilter.new(
      webkit_file_chooser_request_get_mime_types_filter($!wfcr)
    );
  }

  method get_select_multiple {
    so webkit_file_chooser_request_get_select_multiple($!wfcr);
  }

  method get_type {
    webkit_file_chooser_request_get_type();
  }

  multi method select_files (@files) {
    my $f = CArray[Str].new;
    $f[$_] = @files[$_] for ^@files;
    $f[@files.elems] = Str;
    samewith($f);
  }
  multi method select_files (CArray[Str] $files) {
    webkit_file_chooser_request_select_files($!wfcr, $files);
  }

  multi method get_selected_files {
    my ($sfi, $f, @f) = (0);
    my $sf = webkit_file_chooser_get_selected_files($!wfcr);
    @f.push($f) while ($f = $sf[$sfi++]).defined;
    @f;
  }

}
