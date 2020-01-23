use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::FormSubmissionRequest;

use GLib::Roles::Object;

class WebkitGTK::FormSubmissionRequest {
  also does GLib::Roles::Object;

  has WebKitFormSubmissionRequest $!wfsr is implementor;

  submethod BUILD (:$request) {
    $!wfsr = $request;

    self.roleInit-Object;
  }

  method new (WebKitFormSubmissionRequest $request) {
    $request ?? self.bless(:$request) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_form_submission_request_get_type,
      $n,
      $t
    );
  }

  # This DEFINITELY needs a multi! I don't even see why they need to do it
  # this way. Why not an array of Str?
  multi method list_test_fields is also<list-test-fields> {
    my @r = callwith($, $, :all);

    @r[0] ?? @r[1..*] !! Nil;
  }
  multi method list_text_fields (
    $field_names  is rw,
    $field_values is rw,
    :$all = False
  )
    is also<list-text-fields>
  {
    my $fn = CArray[Pointer[GPtrArray]].new;
    $fn[0] = Pointer[GPtrArray];

    my $fv = CArray[Pointer[GPtrArray]].new;
    $fv[0] = Pointer[GPtrArray];

    my $rc = webkit_form_submission_request_list_text_fields($!wfsr, $fn, $fv);

    return Nil unless $rc;

    $field_names  = CArrayToArray( $fn[0] ) if $fn[0];
    $field_values = CArrayToArray( $fv[0] ) if $fv[0];

    ($rc.so, $field_names, $field_values);
  }

  method submit {
    webkit_form_submission_request_submit($!wfsr);
  }

}
