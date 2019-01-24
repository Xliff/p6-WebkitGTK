use v6.c;

use GTK::Compat::Types;

use WebkitGTK::JavaScript::Raw::Class;
use WebkitGTK::JavaScript::Raw::Types;

class WebkitGTK::JavaScript::Class {
  has JSCClass $!jsc;

  submethod BUILD (:$class) {
    $!jsc = $class;
  }

  method new (JSCClass $class) {
    self.bless(:$class);
  }

  method add_constructor_variadic (
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    Int() $return_type
  ) {
    my guint $rt = self.RESOLVE-UINT($return_type);
    jsc_class_add_constructor_variadic(
      $!jsc, $name, $callback, $user_data, $destroy_notify, $rt
    );
  }

  method add_constructor (
    Str() $name,
    GCallback $callback,
    @param_types,
    Int() $return_type = G_TYPE_NONE,
    gpointer $user_data = Pointer,
    GDestroyNotify $destroy_notify = Pointer,
  ) {
    die '@param_types must be a list of JSCValues'
      unless @parameters.all ~~ Int;
    self.add_constructorv(
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $return_type,
      @param_types.elems,
      typesToCArray(@param_types)
    );
  }

  method add_constructorv (
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    Int() $return_type,
    guint $n_parameters,
    CArray[GType] $parameter_types
  ) {
    my guint $rt = self.RESOLVE-UINT($return_type);
    jsc_class_add_constructorv(
      $!jsc,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $return_type,
      $n_parameters,
      $parameter_types
    );
  }

  method add_method_variadic (
    Str() $name,
    GCallback $callback,
    gpointer $user_data = Pointer,
    GDestroyNotify $destroy_notify = Pointer,
    Int() $return_type = G_TYPE_NONE
  ) {
    my guint $rt = self.RESOLVE-UINT($return_type);
    jsc_class_add_method_variadic(
      $!jsc, $name, $callback, $user_data, $destroy_notify, $return_type
    );
  }

  method add_method (
    Str() $name,
    GCallback $callback,
    @param_types,
    Int() $return_type = G_TYPE_NONE,
    gpointer $user_data, = Pointer
    GDestroyNotify $destroy_notify = Pointer
  ) {
    die '@param_types must be a list of GTypeEnum compatible integers'
      unless @param_types.all ~~ Int;
    self.add_methodv(
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $return_type,
      @param_types.elems,
      typesToCArray(@param_types)
    );
  }

  method add_methodv (
    Str() $name,
    GCallback $callback,
    gpointer $user_data,
    GDestroyNotify $destroy_notify,
    Int() $return_type,
    guint $n_parameters,
    GType $parameter_types
  ) {
    my guint $rt = self.RESOLVE-UINT($return_type);
    jsc_class_add_methodv(
      $!jsc,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $rt,
      $n_parameters,
      $parameter_types
    );
  }

  method add_property (
    Str() $name,
    Int() $property_type,
    GCallback $getter,
    GCallback $setter,
    gpointer $user_data = Pointer,
    GDestroyNotify $destroy_notify = Pointer
  ) {
    my guint $pt = self.RESOLVE-UINT($property_type);
    jsc_class_add_property(
      $!jsc,
      $name,
      $pt,
      $getter,
      $setter,
      $user_data,
      $destroy_notify
    );
  }

  method get_name {
    jsc_class_get_name($!jsc);
  }

  method get_parent {
    jsc_class_get_parent($!jsc);
  }

  method get_type {
    jsc_class_get_type();
  }

}
