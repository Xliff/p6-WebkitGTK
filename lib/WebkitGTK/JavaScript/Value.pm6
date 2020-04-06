use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Types;
use GLib::Roles::Signals::Generic;

use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::Value;

use WebkitGTK::JavaScript::Utils;

use GLib::Roles::Object;

class WebkitGTK::JavaScript::Value {
  also does GLib::Roles::Object;

  has JSCValue $!jv is implementor;

  submethod BUILD (:$value) {
    $!jv = $value;

    self.roleInit-Object;
  }

  method WebkitGTK::JavaScript::Raw::Types::JSCValue
    is also<JSCValue>
  { $!jv }

  method new(JSCValue $value) {
    $value ?? self.bless(:$value) !! Nil;
  }

  method new_null(JSCContext() $c) is also<new-null> {
    my $value = jsc_value_new_null($c);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_number (JSCContext() $c, Num() $number) is also<new-number> {
    my $value = jsc_value_new_number($c, $number);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_object (
    JSCContext() $c,
    gpointer $instance,
    JSCClass() $jsc_class
  )
    is also<new-object>
  {
    my $value = jsc_value_new_object($c, $instance, $jsc_class);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_string (JSCContext() $c, Str() $string) is also<new-string> {
    my $value = jsc_value_new_string($c, $string);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_string_from_bytes (JSCContext() $c, GBytes() $bytes)
    is also<new-string-from-bytes>
  {
    my $value = jsc_value_new_string_from_bytes($c, $bytes);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_undefined (JSCContext() $c) is also<new-undefined> {
    my $value = jsc_value_new_undefined($c);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_array_from_strv(JSCContext() $c, CArray[Str] $strv)
    is also<new-array-from-strv>
  {
    my $value = jsc_value_new_array_from_strv($c, $strv);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_array_from_garray (JSCContect() $c, GPtrArray() $array)
    is also<new-array-from-garray>
  {
    my $value = jsc_value_new_array_from_garray($c, $array);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_boolean (JSCContext() $c, Int() $val)
    is also<new-boolean>
  {
    my gboolean $v = $val.so.Int;
    my $value = jsc_value_new_boolean($c, $v);

    $value ?? self.bless(:$value) !! Nil;
  }

  method new_function_variadic (
    JSCContext() $c,
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    GType $return_type
  )
    is also<new-function-variadic>
  {
    my $value = jsc_value_new_function_variadic(
      $c,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $return_type
    );

    $value ?? self.bless(:$value) !! Nil;
  }

  proto method new_functionv (|)
    is also<new-functionv>
  { * }

  multi method new_functionv (
    JSCContect() $c,
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    GType $return_type,
    @parameter_types
  ) {
    samewith(
      $c,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $return_type,
      @parameter_types.elems,
      typesToCArray(@parameter_types),
    )
  }
  multi method new_functionv (
    JSCContect() $c,
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    GType $return_type,
    Int() $n_parameters,
    CArray[GType] $parameter_types
  ) {
    my guint $np = $n_parameters;
    my $value = jsc_value_new_functionv(
      $c,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $return_type,
      $np,
      $parameter_types
    );

    $value ?? self.bless(:$value) !! Nil;
  }

  proto method constructor_callv (|)
    is also<constructor-callv>
  { * }

  multi method constructor_callv (@parameters) {
    samewith(@parameters.elems, paramsToCArray(@parameters) );
  }
  multi method constructor_callv (
    Int() $n_parameters,
    CArray[JSCValue] $parameters
  ) {
    my guint $np = $n_parameters;

    jsc_value_constructor_callv($!jv, $np, $parameters);
  }

  proto method function_callv (|)
    is also<function-callv>
  { * }

  multi method function_callv (@parameters) {
    samewith(@parameters.elems, paramsToCArray(@parameters) );
  }
  multi method function_callv (
    Int() $n_parameters,
    CArray[JSCValue] $parameters
  ) {
    my guint $np = $n_parameters;

    jsc_value_function_callv($!jv, $np, $parameters);
  }

  method get_context (:$raw = False) is also<get-context> {
    my $c = jsc_value_get_context($!jv);

    $c ??
      ( $raw ?? $c !! ::('WebkitGTK::JavaScript::Context').new($c) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &jsc_value_get_type, $n, $t );
  }

  method is_array is also<is-array> {
    so jsc_value_is_array($!jv);
  }

  method is_boolean is also<is-boolean> {
    so jsc_value_is_boolean($!jv);
  }

  method is_constructor is also<is-constructor> {
    so jsc_value_is_constructor($!jv);
  }

  method is_function is also<is-function> {
    so jsc_value_is_function($!jv);
  }

  method is_null is also<is-null> {
    so jsc_value_is_null($!jv);
  }

  method is_number is also<is-number> {
    so jsc_value_is_number($!jv);
  }

  method is_object is also<is-object> {
    so jsc_value_is_object($!jv);
  }

  method is_string is also<is-string> {
    so jsc_value_is_string($!jv);
  }

  method is_undefined is also<is-undefined> {
    so jsc_value_is_undefined($!jv);
  }

  method object_define_property_accessor (
    Str() $property_name,
    Int() $flags,               # JSCValuePropertyFlags $flags,
    GType $property_type,
    GCallback $getter,
    GCallback $setter,
    gpointer $user_data            = gpointer,
    GDestroyNotify $destroy_notify = GDestroyNotify
  )
    is also<object-define-property-accessor>
  {
    my guint $f = $flags;

    jsc_value_object_define_property_accessor(
      $!jv,
      $property_name,
      $f,
      $property_type,
      $getter,
      $setter,
      $user_data,
      $destroy_notify
    );
  }

  method object_define_property_data (
    Str() $property_name,
    Int() $flags,               # JSCValuePropertyFlags $flags,
    JSCValue() $property_value
  )
    is also<object-define-property-data>
  {
    my guint $f = $flags;

    jsc_value_object_define_property_data(
      $!jv, $property_name, $flags, $property_value
    );
  }

  method object_delete_property (Str() $name)
    is also<object-delete-property>
  {
    jsc_value_object_delete_property($!jv, $name);
  }

  method object_enumerate_properties is also<object-enumerate-properties> {
    jsc_value_object_enumerate_properties($!jv);
  }

  method object_get_property (Str() $name) is also<object-get-property> {
    jsc_value_object_get_property($!jv, $name);
  }

  method object_get_property_at_index (Int() $index)
    is also<object-get-property-at-index>
  {
    my guint $i = $index;

    jsc_value_object_get_property_at_index($!jv, $i);
  }

  method object_has_property (Str() $name) is also<object-has-property> {
    jsc_value_object_has_property($!jv, $name);
  }

  proto method object_invoke_methodv (|)
    is also<object-object-invoke-methodv>
  { * }

  multi method object_invoke_methodv(Str() $name, @parameters) {
    samewith( $name, @parameters.elems, paramsToCArray(@parameters) );
  }
  multi method object_invoke_methodv (
    Str() $name,
    Int() $n_parameters,
    CArray[JSCValue] $parameters
  ) {
    my guint $np = $n_parameters;

    jsc_value_object_invoke_methodv($!jv, $name, $np, $parameters);
  }

  method object_is_instance_of (Str() $name)
    is also<object-is-instance-of>
  {
    so jsc_value_object_is_instance_of($!jv, $name);
  }

  method object_set_property (Str() $name, JSCValue $property)
    is also<object-set-property>
  {
    jsc_value_object_set_property($!jv, $name, $property);
  }

  method object_set_property_at_index (Int() $index, JSCValue $property)
    is also<object-set-property-at-index>
  {
    my guint $i = $index;

    jsc_value_object_set_property_at_index($!jv, $i, $property);
  }

  method to_boolean is also<to-boolean> {
    jsc_value_to_boolean($!jv);
  }

  method to_double is also<to-double> {
    jsc_value_to_double($!jv);
  }

  method to_int32 is also<to-int32> {
    jsc_value_to_int32($!jv);
  }

  method to_string is also<to-string> {
    jsc_value_to_string($!jv);
  }

  method to_string_as_bytes is also<to-string-as-bytes> {
    jsc_value_to_string_as_bytes($!jv);
  }

}
