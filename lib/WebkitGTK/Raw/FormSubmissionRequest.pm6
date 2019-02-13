use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::FormSubmissionRequest;

sub webkit_form_submission_request_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_form_submission_request_list_text_fields (
  WebKitFormSubmissionRequest $request,
  CArray[Pointer[GPtrArray]] $field_names,
  CArray[Pointer[GPtrArray]] $field_values
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_form_submission_request_submit (
  WebKitFormSubmissionRequest $request
)
  is native(webkit)
  is export
  { * }
