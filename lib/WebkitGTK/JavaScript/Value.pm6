use v6.c;

use Method::Also;
use NativeCall;


use GTK::Roles::Types;
use GTK::Roles::Signals::Generic;

use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::Value;

use WebkitGTK::JavaScript::Utils;

class WebkitGTK::JavaScript::Value {
  also does GTK::Roles::Types;

  has JSCValue $!jv;

  submethod BUILD (:$value) {
    $!jv = $value;
  }
  
  method WebkitGTK::JavaScript::Raw::Types::JSCValue 
    is also<JSCValue>
  { $!jv }

  method new(JSCValue $value) {
    self.bless(:$value);
  }

  method new_null(JSCContext() $c) is also<new-null> {
    self.bless( value => jsc_value_new_null($c) );
  }

  method new_number (JSCContext() $c, Num() $number) is also<new-number> {
    self.bless( value => jsc_value_new_number($c, $number) );
  }

  method new_object (
    JSCContext() $c,
    gpointer $instance,
    JSCClass() $jsc_class
  ) 
    is also<new-object> 
  {
    self.bless( value => jsc_value_new_object($c, $instance, $jsc_class) );
  }

  method new_string (JSCContext() $c, Str() $string) is also<new-string> {
    self.bless( value => jsc_value_new_string($c, $string) );
  }

  method new_string_from_bytes (JSCContext() $c, GBytes() $bytes) 
    is also<new-string-from-bytes> 
  {
    self.bless( value => jsc_value_new_string_from_bytes($c, $bytes) );
  }

  method new_undefined (JSCContext() $c) is also<new-undefined> {
    self.bless( value => jsc_value_new_undefined($c) );
  }

  method new_array_from_strv(JSCContext() $c, CArray[Str] $strv) 
    is also<new-array-from-strv> 
  {
    self.bless( value => jsc_value_new_array_from_strv($c, $strv) );
  }

  method new_array_from_garray (JSCContect() $c, GPtrArray $array) 
    is also<new-array-from-garray> 
  {
    self.bless( value => jsc_value_new_array_from_garray($c, $array) );
  }

  method new_boolean (JSCContext() $c, gboolean $value) 
    is also<new-boolean> 
  {
    self.bless( value => jsc_value_new_boolean($c, $value) );
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
  ) 
    is also<new-functionv> 
  {
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
    my guint $np = self.RESOLVE-UINT($n_parameters);
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
    my guint $np = self.RESOLVE-UINT($n_parameters);
    jsc_value_function_callv($!jv, $np, $parameters);
  }

  method get_context is also<get-context> {
    jsc_value_get_context($!jv);
  }

  method get_type is also<get-type> {
    jsc_value_get_type();
  }

  method is_array is also<is-array> {
    jsc_value_is_array($!jv);
  }

  method is_boolean is also<is-boolean> {
    jsc_value_is_boolean($!jv);
  }

  method is_constructor is also<is-constructor> {
    jsc_value_is_constructor($!jv);
  }

  method is_function is also<is-function> {
    jsc_value_is_function($!jv);
  }

  method is_null is also<is-null> {
    jsc_value_is_null($!jv);
  }

  method is_number is also<is-number> {
    jsc_value_is_number($!jv);
  }

  method is_object is also<is-object> {
    jsc_value_is_object($!jv);
  }

  method is_string is also<is-string> {
    jsc_value_is_string($!jv);
  }

  method is_undefined is also<is-undefined> {
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
  ) 
    is also<object-define-property-accessor> 
  {
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
  ) 
    is also<object-define-property-data> 
  {
    my guint $f = self.RESOLVE-UINT($flags);
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
    my guint $i = self.RESOLVE-UINT($index);
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
    my guint $np = self.RESOLVE-UINT($n_parameters);
    jsc_value_object_invoke_methodv($!jv, $name, $np, $parameters);
  }

  method object_is_instance_of (Str() $name) 
    is also<object-is-instance-of> 
  {
    jsc_value_object_is_instance_of($!jv, $name);
  }

  method object_set_property (Str() $name, JSCValue $property) 
    is also<object-set-property> 
  {
    jsc_value_object_set_property($!jv, $name, $property);
  }

  method object_set_property_at_index (Int() $index, JSCValue $property) 
    is also<object-set-property-at-index> 
  {
    my guint $i = self.RESOLVE-UINT($index);
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
