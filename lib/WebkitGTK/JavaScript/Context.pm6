use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;

use GTK::Roles::Types;

use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::Context;

class WebkitGTK::JavaScript::Context {
  also does GTK::Roles::Types;

  has JSCContext $!jsc;

  submethod BUILD (:$context) {
    $!jsc = $context;
  }

  method WebkitGTK::JavaScript::Raw::Types::JSCContext
    is also<JSCContext>
  { $!jsc }

  multi method new (JSCContext $context) {
    self.bless(:$context);
  }
  multi method new {
    self.bless( context => jsc_context_new() );
  }

  method get_current
    is also<
      get-current
      current
    >
  {
    self.bless( context => jsc_context_get_current() );
  }

  method new_with_virtual_machine(JSCVirtualMachine() $vm)
    is also<new-with-virtual-machine>
  {
    my $context = jsc_context_new_with_virtual_machine($vm);
    self.bless(:$context);
  }

  proto method check_syntax (|)
    is also<check-syntax>
  { * }

  multi method check_syntax (
    Str() $code,
    Int() $length,
    Int() $mode,
    Str() $uri,
    Int() $line_number
  ) {
    my $e = CArray[Pointer[JSCException]].new;
    my $rc = samewith ($code, $length, $mode, $uri, $line_number, $e);
    ($rc, $e);
  }
  multi method check_syntax (
    Str() $code,
    Int() $length,
    Int() $mode,
    Str() $uri,
    Int() $line_number,
    CArray[Pointer[JSCException]] $exception is copy
  ) {
    my guint ($l, $m, $ln) = self.RESOLVE-UINT($length, $mode, $line_number);
    jsc_context_check_syntax($!jsc, $code, $l, $m, $uri, $ln, $exception);
  }

  method clear_exception is also<clear-exception> {
    jsc_context_clear_exception($!jsc);
  }

  method evaluate (Str() $code, Int() $length) {
    my guint $l = self.RESOLVE-UINT($length);
    jsc_context_evaluate($!jsc, $code, $l);
  }

  method evaluate_in_object (
    Str() $code,
    Int() $length,
    gpointer $object_instance,
    JSCClass() $object_class,
    Str() $uri,
    Int() $line_number,
    JSCValue() $object
  )
    is also<evaluate-in-object>
  {
    my ($l, $ln) = self.RESOLVE-UINT($length, $line_number);
    jsc_context_evaluate_in_object(
      $!jsc, $code, $l, $object_instance, $object_class, $uri, $ln, $object);
  }

  method evaluate_with_source_uri (
    Str() $code,
    Int() $length,
    Str() $uri,
    Int() $line_number
  )
    is also<evaluate-with-source-uri>
  {
    my ($l, $ln) = self.RESOLVE-UINT($length, $line_number);
    jsc_context_evaluate_with_source_uri($!jsc, $code, $l, $uri, $ln);
  }

  method get_exception
    is also<
      get-exception
      exception
    >
  {
    jsc_context_get_exception($!jsc);
  }

  method get_global_object
    is also<
      get-global-object
      global_object
      global-object
    >
  {
    jsc_context_get_global_object($!jsc);
  }

  method get_type is also<get-type> {
    state ($n, $t);
    unstable_get_type( self.^name, &jsc_context_get_type, $n, $t );
  }

  method get_value (Str() $name) is also<get-value> {
    jsc_context_get_value($!jsc, $name);
  }

  method get_virtual_machine
    is also<
      get-virtual-machine
      virtual_machine
      virtual-machine
    >
  {
    jsc_context_get_virtual_machine($!jsc);
  }

  method pop_exception_handler is also<pop-exception-handler> {
    jsc_context_pop_exception_handler($!jsc);
  }

  method push_exception_handler (
    JSCExceptionHandler $handler,
    gpointer $user_data = Pointer,
    GDestroyNotify $destroy_notify = Pointer
  )
    is also<push-exception-handler>
  {
    jsc_context_push_exception_handler(
      $!jsc, $handler, $user_data, $destroy_notify
    );
  }

  method register_class (
    Str() $name,
    JSCClass() $parent_class,
    JSCClassVTable() $vtable,
    GDestroyNotify $destroy_notify = Pointer
  )
    is also<register-class>
  {
    jsc_context_register_class(
      $!jsc, $name, $parent_class, $vtable, $destroy_notify
    );
  }

  method set_value (Str() $name, JSCValue() $value) is also<set-value> {
    jsc_context_set_value($!jsc, $name, $value);
  }

  method throw (Str() $error_message) {
    jsc_context_throw($!jsc, $error_message);
  }

  method throw_exception (JSCException() $exception)
    is also<throw-exception>
  {
    jsc_context_throw_exception($!jsc, $exception);
  }

  method throw_with_name (Str() $error_name, Str() $error_message)
    is also<throw-with-name>
  {
    jsc_context_throw_with_name($!jsc, $error_name, $error_message);
  }

}
