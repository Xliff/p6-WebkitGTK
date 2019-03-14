use v6.c;

use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::Exception;

class WebkitGTK::JavaScript::Exception {
  hsa JSCException $!jse;

  submethod BUILD (:$exception) {
    $!jse = $exception;
  }

  method new (Str() $message) {
    self.bless( exception =>  jsc_exception_new($!jse, $message) );
  }

  method new_with_name (Str() $name, Str() $message) is also<new-with-name> {
    my $exception = jsc_exception_new_with_name($!jse, $name, $message);
    self.bless(:$exception);
  }

  method get_backtrace_string is also<get-backtrace-string> {
    jsc_exception_get_backtrace_string($!jse);
  }

  method get_column_number is also<get-column-number> {
    jsc_exception_get_column_number($!jse);
  }

  method get_line_number is also<get-line-number> {
    jsc_exception_get_line_number($!jse);
  }

  method get_message is also<get-message> {
    jsc_exception_get_message($!jse);
  }

  method get_name is also<get-name> {
    jsc_exception_get_name($!jse);
  }

  method get_source_uri is also<get-source-uri> {
    jsc_exception_get_source_uri($!jse);
  }

  method get_type is also<get-type> {
    jsc_exception_get_type();
  }

  method report {
    jsc_exception_report($!jse);
  }

  method to_string is also<to-string> {
    jsc_exception_to_string($!jse);
  }

}

