use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::FormSubmissionRequest;

class WebkitGTK::FormSubmissionRequest {
  has WebKitFormSubmissionRequest $!wfsr;

  submethod BUILD (:$request) {
    $!wfsr = $request;
  }

  method new (WebKitFormSubmissionRequest $request) {
    self.bless(:$request);
  }

  method get_type {
    webkit_form_submission_request_get_type();
  }

  # This DEFINITELY needs a multi! I don't even see why they need to do it
  # this way. Why not an array of Str?
  multi method list_test_fields {
    my $fn = CArray[Pointer[GPtrArray]].new;
    my $fv = CArray[Pointer[GPtrArray]].new;
    samewith($fn, $fv);
  }
  multi method list_text_fields (
    CArray[Pointer[GPtrArray]] $field_names,
    CArray[Pointer[GPtrArray]] $field_values
  ) {
    my $rc = webkit_form_submission_request_list_text_fields(
      $!wfsr, $field_names, $field_values
    );

    my @field_names;
    with $field_names[0] {
      my $pa = GTK::Compat::PtrArray.new($field_names[0]);
      $pa.downref; # Remove if SEGV
      @field_names.push: nativecast( Str, $pa.index($_) )
        for ^$pa.elems;
    }

    my @field_values;
    with $field_values[0] {
      my $pa = GTK::Compat::PtrArray.new($field_values[0]);
      $pa.downref; # Remove if SEGV
      @field_values.push: nativecast( Str, $pa.index($_) )
        for ^$pa.elems;
    }

    ($rc.so, @field_names, @field_values);
  }

  method submit {
    webkit_form_submission_request_submit($!wfsr);
  }

}
