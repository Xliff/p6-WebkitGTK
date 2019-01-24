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

  method new_with_name (Str() $name, Str() $message) {
    my $exception = jsc_exception_new_with_name($!jse, $name, $message);
    self.bless(:$exception);
  }

  method get_backtrace_string {
    jsc_exception_get_backtrace_string($!jse);
  }

  method get_column_number {
    jsc_exception_get_column_number($!jse);
  }

  method get_line_number {
    jsc_exception_get_line_number($!jse);
  }

  method get_message {
    jsc_exception_get_message($!jse);
  }

  method get_name {
    jsc_exception_get_name($!jse);
  }

  method get_source_uri {
    jsc_exception_get_source_uri($!jse);
  }

  method get_type {
    jsc_exception_get_type();
  }

  method report {
    jsc_exception_report($!jse);
  }

  method to_string {
    jsc_exception_to_string($!jse);
  }

}
