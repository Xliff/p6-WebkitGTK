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
  method list_text_fields (
    CArray[Pointer[GPtrArray]] $field_names,
    CArray[Pointer[GPtrArray]] $field_values
  ) {
    my $rc = webkit_form_submission_request_list_text_fields(
      $!wfsr, $field_names, $field_values
    );

    so $rc;
  }

  method submit {
    webkit_form_submission_request_submit($!wfsr);
  }

}
