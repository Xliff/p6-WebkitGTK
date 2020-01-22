use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;
use WebkitGTK::JavaScript::Raw::Types;

unit package WebkitGTK::JavaScript::Raw::Exception;

sub jsc_exception_get_backtrace_string (JSCException $exception)
  returns Str
  is native(jsc)
  is export
  { * }

sub jsc_exception_get_column_number (JSCException $exception)
  returns guint
  is native(jsc)
  is export
  { * }

sub jsc_exception_get_line_number (JSCException $exception)
  returns guint
  is native(jsc)
  is export
  { * }

sub jsc_exception_get_message (JSCException $exception)
  returns Str
  is native(jsc)
  is export
  { * }

sub jsc_exception_get_name (JSCException $exception)
  returns Str
  is native(jsc)
  is export
  { * }

sub jsc_exception_get_source_uri (JSCException $exception)
  returns Str
  is native(jsc)
  is export
  { * }

sub jsc_exception_get_type ()
  returns GType
  is native(jsc)
  is export
  { * }

sub jsc_exception_new (JSCContext $context, Str $message)
  returns JSCException
  is native(jsc)
  is export
  { * }

sub jsc_exception_new_with_name (
  JSCContext $context,
  Str $name,
  Str $message
)
  returns JSCException
  is native(jsc)
  is export
  { * }

sub jsc_exception_report (JSCException $exception)
  returns Str
  is native(jsc)
  is export
  { * }

sub jsc_exception_to_string (JSCException $exception)
  returns Str
  is native(jsc)
  is export
  { * }
