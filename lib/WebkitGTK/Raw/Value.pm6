use v6.c;

use GTK::Compat::Types;
use WebkitGTK::JavaScript::Raw::Types;

unit package WebkitGTK::JavaScript::Raw::Value;

sub jsc_value_constructor_callv (
  JSCValue $value,
  guint $n_parameters,
  CArray[JSCValue] $parameters
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_function_callv (
  JSCValue $value,
  guint $n_parameters,
  CArray[JSCValue] $parameters
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_get_context (JSCValue $value)
  returns JSCContext
  is native(jsc)
  is export
  { * }

sub jsc_value_get_type ()
  returns GType
  is native(jsc)
  is export
  { * }

sub jsc_value_is_array (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_boolean (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_constructor (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_function (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_null (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_number (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_object (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_string (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_is_undefined (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_new_array_from_garray (JSCContext $context, GPtrArray $array)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_boolean (JSCContext $context, gboolean $value)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_function_variadic (
  JSCContext $context,
  Str $name,
  GCallback $callback,
  gpointer $user_data,
  GDestroyNotify $destroy_notify,
  GType $return_type
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_functionv (
  JSCContext $context,
  Str $name,
  GCallback $callback,
  gpointer $user_data,
  GDestroyNotify $destroy_notify,
  GType $return_type,
  guint $n_parameters,
  GType $parameter_types
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_null (JSCContext $context)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_number (JSCContext $context, double $number)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_object (
  JSCContext $context,
  gpointer $instance,
  JSCClass $jsc_class
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_string (JSCContext $context, Str $string)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_string_from_bytes (JSCContext $context, GBytes $bytes)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_new_undefined (JSCContext $context)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_object_define_property_accessor (
  JSCValue $value,
  Str $property_name,
  JSCValuePropertyFlags $flags,
  GType $property_type,
  GCallback $getter,
  GCallback $setter,
  gpointer $user_data,
  GDestroyNotify $destroy_notify
)
  is native(jsc)
  is export
  { * }

sub jsc_value_object_define_property_data (
  JSCValue $value,
  Str $property_name,
  JSCValuePropertyFlags $flags,
  JSCValue $property_value
)
  is native(jsc)
  is export
  { * }

sub jsc_value_object_delete_property (JSCValue $value, Str $name)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_object_enumerate_properties (JSCValue $value)
  returns CArray[Str]
  is native(jsc)
  is export
  { * }

sub jsc_value_object_get_property (JSCValue $value, Str $name)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_object_get_property_at_index (JSCValue $value, guint $index)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_object_has_property (JSCValue $value, Str $name)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_object_invoke_methodv (
  JSCValue $value,
  Str $name,
  guint $n_parameters,
  CArray[JSCValue] $parameters
)
  returns JSCValue
  is native(jsc)
  is export
  { * }

sub jsc_value_object_is_instance_of (JSCValue $value, Str $name)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_object_set_property (
  JSCValue $value,
  Str $name,
  JSCValue $property
)
  is native(jsc)
  is export
  { * }

sub jsc_value_object_set_property_at_index (
  JSCValue $value,
  guint $index,
  JSCValue $property
)
  is native(jsc)
  is export
  { * }

sub jsc_value_to_boolean (JSCValue $value)
  returns uint32
  is native(jsc)
  is export
  { * }

sub jsc_value_to_double (JSCValue $value)
  returns double
  is native(jsc)
  is export
  { * }

sub jsc_value_to_int32 (JSCValue $value)
  returns gint32
  is native(jsc)
  is export
  { * }

sub jsc_value_to_string (JSCValue $value)
  returns char
  is native(jsc)
  is export
  { * }

sub jsc_value_to_string_as_bytes (JSCValue $value)
  returns GBytes
  is native(jsc)
  is export
  { * }

sub jsc_value_new_array_from_strv (
  JSCContext $context,
  CArray[Str] $strv
)
  returns JSCValue
  is native(jsc)
  is export
  { * }
