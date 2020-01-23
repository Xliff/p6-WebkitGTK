use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use WebkitGTK::JavaScript::Raw::Types;

unit package WebkitGTK::JavaScript::Raw::Class;

sub jsc_class_add_constructor_variadic (
  JSCClass $jsc_class,
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

sub jsc_class_add_constructorv (
  JSCClass $jsc_class,
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

sub jsc_class_add_method_variadic (
  JSCClass $jsc_class,
  Str $name,
  GCallback $callback,
  gpointer $user_data,
  GDestroyNotify $destroy_notify,
  GType $return_type
)
  is native(jsc)
  is export
  { * }

sub jsc_class_add_methodv (
  JSCClass $jsc_class,
  Str $name,
  GCallback $callback,
  gpointer $user_data,
  GDestroyNotify $destroy_notify,
  GType $return_type,
  guint $n_parameters,
  GType $parameter_types
)
  is native(jsc)
  is export
  { * }

sub jsc_class_add_property (
  JSCClass $jsc_class,
  Str $name,
  GType $property_type,
  GCallback $getter,
  GCallback $setter,
  gpointer $user_data,
  GDestroyNotify $destroy_notify
)
  is native(jsc)
  is export
  { * }

sub jsc_class_get_name (JSCClass $jsc_class)
  returns Str
  is native(jsc)
  is export
  { * }

sub jsc_class_get_parent (JSCClass $jsc_class)
  returns JSCClass
  is native(jsc)
  is export
  { * }

sub jsc_class_get_type ()
  returns GType
  is native(jsc)
  is export
  { * }
