use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::JavaScript::Raw::Types;

unit package WebkitGTK::JavaScript::Raw::Context;

sub jsc_context_check_syntax (
  JSCContext $context,
  Str $code,
  gssize $length,
  JSCCheckSyntaxMode $mode,
  Str $uri,
  guint $line_number,
  CArray[Pointer[JSCException]] $exception
)
  returns JSCCheckSyntaxResult
  is native(jsc)
  is export
  { * }

sub jsc_context_clear_exception (JSCContext $context)
  is native(jsc)
  is export
  { * }

sub jsc_context_evaluate (
  JSCContext $context,
  Str $code,
  gssize $length
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_context_evaluate_in_object (
  JSCContext $context,
  Str $code,
  gssize $length,
  gpointer $object_instance,
  JSCClass $object_class,
  Str $uri,
  guint $line_number,
  CArray[Pointer[JSCValue]] $object
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_context_evaluate_with_source_uri (
  JSCContext $context,
  Str $code,
  gssize $length,
  Str $uri,
  guint $line_number
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_context_get_current ()
  returns JSCContext
  is native(jsc)
  is export
  { * }

sub jsc_context_get_exception (JSCContext $context)
  returns JSCException
  is native(jsc)
  is export
  { * }

sub jsc_context_get_global_object (JSCContext $context)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_context_get_type ()
  returns GType
  is native(jsc)
  is export
  { * }

sub jsc_context_get_value (JSCContext $context, Str $name)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_context_get_virtual_machine (JSCContext $context)
  returns JSCVirtualMachine
  is native(jsc)
  is export
  { * }

sub jsc_context_new ()
  returns JSCContext
  is native(jsc)
  is export
  { * }

sub jsc_context_new_with_virtual_machine (JSCVirtualMachine $vm)
  returns JSCContext
  is native(jsc)
  is export
  { * }

sub jsc_context_pop_exception_handler (JSCContext $context)
  is native(jsc)
  is export
  { * }

sub jsc_context_push_exception_handler (
  JSCContext $context,
  JSCExceptionHandler $handler,
  gpointer $user_data,
  GDestroyNotify $destroy_notify
)
  is native(jsc)
  is export
  { * }

sub jsc_context_register_class (
  JSCContext $context,
  Str $name,
  JSCClass $parent_class,
  JSCClassVTable $vtable,
  GDestroyNotify $destroy_notify
)
  returns JSCClass
  is native(jsc)
  is export
  { * }

sub jsc_context_set_value (
  JSCContext $context,
  Str $name,
  JSCValue $value
)
  is native(jsc)
  is export
  { * }

sub jsc_context_throw (JSCContext $context, Str $error_message)
  is native(jsc)
  is export
  { * }

sub jsc_context_throw_exception (
  JSCContext $context,
  JSCException $exception
)
  is native(jsc)
  is export
  { * }

sub jsc_context_throw_with_name (
  JSCContext $context,
  Str $error_name,
  Str $error_message
)
  is native(jsc)
  is export
  { * }
