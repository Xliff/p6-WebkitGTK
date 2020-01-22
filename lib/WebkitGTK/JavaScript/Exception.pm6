use v6.c;

use Method::Also;



use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::Exception;

class WebkitGTK::JavaScript::Exception {
  has JSCException $!jse;

  submethod BUILD (:$exception) {
    $!jse = $exception;
  }

  method new (JSCContext() $context, Str() $message) {
    self.bless( exception =>  jsc_exception_new($context, $message) );
  }

  method new_with_name (
    JSCContext() $context,
    Str() $name,
    Str() $message
  )
    is also<new-with-name>
  {
    my $exception = jsc_exception_new_with_name($context, $name, $message);
    self.bless(:$exception);
  }

  method get_backtrace_string
    is also<
      get-backtrace-string
      backtrace_string
      backtrace-string
    >
  {
    jsc_exception_get_backtrace_string($!jse);
  }

  method get_column_number
    is also<
      get-column-number
      column_number
      column-number
    >
  {
    jsc_exception_get_column_number($!jse);
  }

  method get_line_number
    is also<
      get-line-number
      line_number
      line-number
    >
  {
    jsc_exception_get_line_number($!jse);
  }

  method get_message
    is also<
      get-message
      message
    >
  {
    jsc_exception_get_message($!jse);
  }

  method get_name
    is also<
      get-name
      name
    >
  {
    jsc_exception_get_name($!jse);
  }

  method get_source_uri
    is also<
      get-source-uri
      source_uri
      source-uri
    >
  {
    jsc_exception_get_source_uri($!jse);
  }

  method get_type is also<get-type> {
    state ($n, $t);
    unstable_get_type( self.^name, &jsc_exception_get_type, $n, $t );
  }

  method report {
    jsc_exception_report($!jse);
  }

  method to_string
    is also<
      to-string
      Str
    >
  {
    jsc_exception_to_string($!jse);
  }

}
