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
  ) 
    is also<add-constructor-variadic> 
  {
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
  ) 
    is also<add-constructor> 
  {
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
  ) 
    is also<add-constructorv> 
  {
    my guint ($rt, $np) = self.RESOLVE-UINT($return_type, $n_parameters);
    jsc_class_add_constructorv(
      $!jsc,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $rt,
      $np,
      $parameter_types
    );
  }

  method add_method_variadic (
    Str() $name,
    GCallback $callback,
    gpointer $user_data = Pointer,
    GDestroyNotify $destroy_notify = Pointer,
    Int() $return_type = G_TYPE_NONE
  ) 
    is also<add-method-variadic> 
  {
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
  ) 
    is also<add-method> 
  {
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
    Int() $n_parameters,
    GType $parameter_types
  ) 
    is also<add-methodv> 
  {
    my guint ($rt, $np) = self.RESOLVE-UINT($return_type, $n_parameters);
    jsc_class_add_methodv(
      $!jsc,
      $name,
      $callback,
      $user_data,
      $destroy_notify,
      $rt,
      $np,
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
  ) 
    is also<add-property> 
  {
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

  method get_name is also<get-name> {
    jsc_class_get_name($!jsc);
  }

  method get_parent is also<get-parent> {
    WebkitGTK::JavaScript::Class.new( jsc_class_get_parent($!jsc) );
  }

  method get_type is also<get-type> {
    jsc_class_get_type();
  }

}
