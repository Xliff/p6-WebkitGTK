use v6.c;

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

  multi method new (JSCContext $context) {
    self.bless(:$context);
  }
  multi method new {
    self.bless( context => jsc_context_new() );
  }

  method get_current {
    self.bless( context => jsc_context_get_current() );
  }

  method new_with_virtual_machine(JSCVirtualMachine() $vm) {
    my $context = jsc_context_new_with_virtual_machine($vm);
    self.bless(:$context);
  }

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

  method clear_exception {
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
  ) {
    my ($l, $ln) = self.RESOLVE-UINT($length, $line_number);
    jsc_context_evaluate_in_object(
      $!jsc, $code, $l, $object_instance, $object_class, $uri, $ln, $object);
  }

  method evaluate_with_source_uri (
    Str() $code,
    Int() $length,
    Str() $uri,
    Int() $line_number
  ) {
    my ($l, $ln) = self.RESOLVE-UINT($length, $line_number);
    jsc_context_evaluate_with_source_uri($!jsc, $code, $l, $uri, $ln);
  }

  method get_exception {
    jsc_context_get_exception($!jsc);
  }

  method get_global_object {
    jsc_context_get_global_object($!jsc);
  }

  method get_type {
    jsc_context_get_type();
  }

  method get_value (Str() $name) {
    jsc_context_get_value($!jsc, $name);
  }

  method get_virtual_machine {
    jsc_context_get_virtual_machine($!jsc);
  }

  method pop_exception_handler {
    jsc_context_pop_exception_handler($!jsc);
  }

  method push_exception_handler (
    JSCExceptionHandler $handler,
    gpointer $user_data = Pointer,
    GDestroyNotify $destroy_notify = Pointer
  ) {
    jsc_context_push_exception_handler(
      $!jsc, $handler, $user_data, $destroy_notify
    );
  }

  method register_class (
    Str() $name,
    JSCClass() $parent_class,
    JSCClassVTable() $vtable,
    GDestroyNotify $destroy_notify = Pointer
  ) {
    jsc_context_register_class(
      $!jsc, $name, $parent_class, $vtable, $destroy_notify
    );
  }

  method set_value (Str() $name, JSCValue() $value) {
    jsc_context_set_value($!jsc, $name, $value);
  }

  method throw (Str() $error_message) {
    jsc_context_throw($!jsc, $error_message);
  }

  method throw_exception (JSCException() $exception) {
    jsc_context_throw_exception($!jsc, $exception);
  }

  method throw_with_name (Str() $error_name, Str() $error_message) {
    jsc_context_throw_with_name($!jsc, $error_name, $error_message);
  }

}
