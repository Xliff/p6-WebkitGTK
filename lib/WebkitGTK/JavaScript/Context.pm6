use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Types;

use WebkitGTK::JavaScript::Raw::Enums;
use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::Context;

use WebkitGTK::JavaScript::Value;
use WebkitGTK::JavaScript::Exception;

use GLib::Roles::Object;

class WebkitGTK::JavaScript::Context {
  also does GLib::Roles::Object;

  has JSCContext $!jsc is implementor;

  submethod BUILD (:$context) {
    $!jsc = $context;

    self.roleInit-Object;
  }

  method WebkitGTK::JavaScript::Raw::Types::JSCContext
    is also<JSCContext>
  { $!jsc }

  multi method new (JSCContext $context) {
    $context ?? self.bless(:$context) !! Nil;
  }
  multi method new {
    my $context = jsc_context_new();

    $context ?? self.bless(:$context) !! Nil;
  }

  method get_current
    is also<
      get-current
      current
    >
  {
    my $context = jsc_context_get_current();

    $context ?? self.bless(:$context) !! Nil;
  }

  method new_with_virtual_machine(JSCVirtualMachine() $vm)
    is also<new-with-virtual-machine>
  {
    my $context = jsc_context_new_with_virtual_machine($vm);

    $context ?? self.bless(:$context) !! Nil;
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
    samewith($code, $length, $mode, $uri, $line_number, $, :all);
  }
  multi method check_syntax (
    Str() $code,
    Int() $length,
    Int() $mode,
    Str() $uri,
    Int() $line_number,
    CArray[Pointer[JSCException]] $exception is copy,
    :$all = False
  ) {
    my guint ($l, $m, $ln) = ($length, $mode, $line_number);

    my $rv = jsc_context_check_syntax(
      $!jsc,
      $code,
      $l,
      $m,
      $uri,
      $ln,
      $exception
    );
    ( JSCCheckSyntaxResultEnum($rv), $exception );
  }

  method clear_exception is also<clear-exception> {
    jsc_context_clear_exception($!jsc);
  }

  method evaluate (Str() $code, Int() $length, :$raw = False) {
    my guint    $l = $length;
    my JSCValue $v = jsc_context_evaluate($!jsc, $code, $l);

    $v ??
      ( $raw ?? $v !! WebkitGTK::JavaScript::Value.new($v) )
      !!
      Nil;
  }

  proto method evaluate_in_object (|)
  { * }

  multi method evaluate_in_object (
    Str()       $code,
    Int()       $length,
    gpointer    $object_instance,
    JSCClass()  $object_class,
    Str()       $uri,
    Int()       $line_number,
               :$raw = False
  ) {
    samewith(
      $code,
      $length,
      $object_instance,
      $object_class,
      $uri,
      $line_number,
      $,
      :all,
      :$raw
    );
  }
  multi method evaluate_in_object (
    Str()       $code,
    Int()       $length,
    gpointer    $object_instance,
    JSCClass()  $object_class,
    Str()       $uri,
    Int()       $line_number,
                $object           is rw,
               :$all                     = False,
               :$raw                     = False
  )
    is also<evaluate-in-object>
  {
    my ($l, $ln) = $length, $line_number;

    my $o = CArray[Pointer[JSCValue]].new;
    $o[0] = Pointer[JSCValue];

    my $v = jsc_context_evaluate_in_object(
      $!jsc,
      $code,
      $l,
      $object_instance,
      $object_class,
      $uri,
      $ln,
      $o
    );

    if $o[0] {
      $object = $o[0];
      $object = WebkitGTK::JavaScript::Value.new($object) unless $raw;
    }

    $v = $v ??
      ( $raw ?? $v !! WebkitGTK::JavaScript::Value.new($v) )
      !!
      Nil;

    $all.not ?? $v !! ($v, $object);
  }

  method evaluate_with_source_uri (
    Str()  $code,
    Int()  $length,
    Str()  $uri,
    Int()  $line_number,
          :$raw = False
  )
    is also<evaluate-with-source-uri>
  {
    my ($l, $ln) = $length, $line_number;
    my $v = jsc_context_evaluate_with_source_uri($!jsc, $code, $l, $uri, $ln);

    $v ??
      ( $raw ?? $v !! WebkitGTK::JavaScript::Value.new($v) )
      !!
      Nil;
  }

  method get_exception ( :$raw = False )
    is also<
      get-exception
      exception
    >
  {
    my $e = jsc_context_get_exception($!jsc);

    $e ??
      ( $raw ?? $e !! WebkitGTK::JavaScript::Exception.new($e) )
      !!
      Nil;
  }

  method get_global_object (:$raw = False)
    is also<
      get-global-object
      global_object
      global-object
    >
  {
    my $v = jsc_context_get_global_object($!jsc);

    $v ??
      ( $raw ?? $v !! WebkitGTK::JavaScript::Value.new($v) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &jsc_context_get_type, $n, $t );
  }

  method get_value (Str() $name, :$raw = False) is also<get-value> {
    my $v = jsc_context_get_value($!jsc, $name);

    $v ??
      ( $raw ?? $v !! WebkitGTK::JavaScript::Value.new($v) )
      !!
      Nil;
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
    gpointer            $user_data      = Pointer,
    GDestroyNotify      $destroy_notify = Pointer
  )
    is also<push-exception-handler>
  {
    jsc_context_push_exception_handler(
      $!jsc, $handler, $user_data, $destroy_notify
    );
  }

  method register_class (
    Str()            $name,
    JSCClass()       $parent_class,
    JSCClassVTable() $vtable,
    GDestroyNotify   $destroy_notify = Pointer
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
