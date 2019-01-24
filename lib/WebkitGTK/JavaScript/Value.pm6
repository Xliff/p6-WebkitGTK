use v6.c;

use GTK::Compat::Types;
use GTK::Roles::Types;
use GTK::Roles::Signals::Generic;

use WebkitGTK::JavaScript::Raw::Value;

use WebkitGTK::JavaScript::Types;
use WebkitGTK::JavaScript::Utils;

class WebkitGTK::JavaScript::Valie {
  also does GTK::Roles::Types;

  has JSCValue $!jv;

  submethod BUILD (:$value) {
    $!jv = $value;
  }

  method new_null(JSCContext() $c) {
    self.bless( value => jsc_value_new_null($c) );
  }

  method new_number (JSCContext() $c, Num() $number) {
    self.bless( value => jsc_value_new_number($c, $number) );
  }

  method new_object (
    JSCContext() $c,
    gpointer $instance,
    JSCClass() $jsc_class
  ) {
    self.bless( value => jsc_value_new_object($c, $instance, $jsc_class) );
  }

  method new_string (JSCContext() $c, Str() $string) {
    self.bless( value => jsc_value_new_string($c, $string) );
  }

  method new_string_from_bytes (JSCContext() $c, GBytes() $bytes) {
    self.bless( value => jsc_value_new_string_from_bytes($c, $bytes) );
  }

  method new_undefined (JSCContext() $c) {
    self.bless( value => jsc_value_new_undefined($c) );
  }

  method new_array_from_strv(JSCContext() $c, CArray[Str] $strv) {
    self.bless( value => jsv_value_new_array_from_strv($c, $strv) );
  }

  method new_array_from_garray (JSCContect() $c, GPtrArray $array) {
    self.bless( value => jsc_value_new_array_from_garray($c, $array) );
  }

  method new_boolean (JSCContext() $c, gboolean $value) {
    self.bless( value => jsc_value_new_boolean($c, $value) );
  }

  method new_function_variadic (
    JSCContext() $c,
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    GType $return_type
  ) {
    self.bless( value => jsc_value_new_function_variadic(
      $c, $name, $callback, $user_data, $destroy_notify, $return_type
    ) );
  }

  method new_functionv (
    JSCContect() $c,
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    GType $return_type,
    Int() $n_parameters,
    GType $parameter_types
  ) {
    my guint $np = self.RESOLVE-UINT($n_parameters);
    self.bless( value => jsc_value_new_functionv(
      $c,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $return_type,
      $np,
      $parameter_types
    ) );
  }

  multi method constructor_callv (@parameters) {
    samewith(@parameters.elems, paramsToCArray(@parameters) );
  }
  multi method constructor_callv (
    Int() $n_parameters,
    CArray[JSCValue] $parameters
  ) {
    my guint $np = self.RESOLVE-UINT($n_parameters);
    jsc_value_constructor_callv($!jv, $np, $parameters);
  }

  multi method function_callv (@parameters) {
    samewith(@parameters.elems, paramsToCArray(@parameters) );
  }
  multi method function_callv (
    Int() $n_parameters,
    CArray[JSCValue] $parameters
  ) {
    my guint $np = self.RESOLVE-UINT($n_parameters);
    jsc_value_function_callv($!jv, $np, $parameters);
  }

  method get_context {
    jsc_value_get_context($!jv);
  }

  method get_type {
    jsc_value_get_type();
  }

  method is_array {
    jsc_value_is_array($!jv);
  }

  method is_boolean {
    jsc_value_is_boolean($!jv);
  }

  method is_constructor {
    jsc_value_is_constructor($!jv);
  }

  method is_function {
    jsc_value_is_function($!jv);
  }

  method is_null {
    jsc_value_is_null($!jv);
  }

  method is_number {
    jsc_value_is_number($!jv);
  }

  method is_object {
    jsc_value_is_object($!jv);
  }

  method is_string {
    jsc_value_is_string($!jv);
  }

  method is_undefined {
    jsc_value_is_undefined($!jv);
  }

  method object_define_property_accessor (
    Str() $property_name,
    Int() $flags,               # JSCValuePropertyFlags $flags,
    GType $property_type,
    GCallback $getter,
    GCallback $setter,
    gpointer $user_data,
    GDestroyNotify $destroy_notify
  ) {
    my guint $f = self.RESOLVE-UINT($flags);
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
  ) {
    my guint $f = self.RESOLVE-UINT($flags);
    jsc_value_object_define_property_data(
      $!jv, $property_name, $flags, $property_value
    );
  }

  method object_delete_property (Str() $name) {
    jsc_value_object_delete_property($!jv, $name);
  }

  method object_enumerate_properties {
    jsc_value_object_enumerate_properties($!jv);
  }

  method object_get_property (Str() $name) {
    jsc_value_object_get_property($!jv, $name);
  }

  method object_get_property_at_index (Int() $index) {
    my guint $i = self.RESOLVE-UINT($index);
    jsc_value_object_get_property_at_index($!jv, $i);
  }

  method object_has_property (Str() $name) {
    jsc_value_object_has_property($!jv, $name);
  }

  multi method object_invoke_methodv(Str() $name, @parameters) {
    samewith( $name, @parameters.elems, paramsToCArray(@parameters) );
  }
  multi method object_invoke_methodv (
    Str() $name,
    Int() $n_parameters,
    CArray[JSCValue] $parameters
  ) {
    my guint $np = self.RESOLVE-UINT($n_parameters);
    jsc_value_object_invoke_methodv($!jv, $name, $np, $parameters);
  }

  method object_is_instance_of (Str() $name) {
    jsc_value_object_is_instance_of($!jv, $name);
  }

  method object_set_property (Str() $name, JSCValue $property) {
    jsc_value_object_set_property($!jv, $name, $property);
  }

  method object_set_property_at_index (Int() $index, JSCValue $property) {
    my guint $i = self.RESOLVE-UINT($index);
    jsc_value_object_set_property_at_index($!jv, $i, $property);
  }

  method to_boolean {
    jsc_value_to_boolean($!jv);
  }

  method to_double {
    jsc_value_to_double($!jv);
  }

  method to_int32 {
    jsc_value_to_int32($!jv);
  }

  method to_string {
    jsc_value_to_string($!jv);
  }

  method to_string_as_bytes {
    jsc_value_to_string_as_bytes($!jv);
  }

}
