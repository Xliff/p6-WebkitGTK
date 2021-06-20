use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Types;

use WebkitGTK::JavaScript::Raw::Class;
use WebkitGTK::JavaScript::Raw::Types;

use WebkitGTK::JavaScript::Utils;

use GLib::Roles::Object;

class WebkitGTK::JavaScript::Class {
  also does GLib::Roles::Object;

  has JSCClass $!jsc is implementor;

  submethod BUILD (:$class) {
    $!jsc = $class;

    self.roleInit-Object;
  }

  method WebkitGTK::JavaScript::Raw::Types::JSCClass
    is also<JSSCClass>
  { $!jsc }

  method new (JSCClass $class) {
    $class ?? self.bless(:$class) !! Nil;
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
    my guint $rt = $return_type;

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
      unless @param_types.all ~~ Int;
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
    Int() $n_parameters,
    CArray[GType] $parameter_types
  )
    is also<add-constructorv>
  {
    my guint ($rt, $np) = ($return_type, $n_parameters);

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
    my guint $rt = $return_type;

    jsc_class_add_method_variadic(
      $!jsc, $name, $callback, $user_data, $destroy_notify, $return_type
    );
  }

  method add_method (
    Str() $name,
    GCallback $callback,
    @param_types,
    Int() $return_type             = G_TYPE_NONE,
    gpointer $user_data            = Pointer,
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
    my guint ($rt, $np) = ($return_type, $n_parameters);

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
    gpointer $user_data            = Pointer,
    GDestroyNotify $destroy_notify = Pointer
  )
    is also<add-property>
  {
    my guint $pt = $property_type;

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

  method get_name
    is also<
      get-name
      name
    >
  {
    jsc_class_get_name($!jsc);
  }

  method get_parent (:$raw = False)
    is also<
      get-parent
      parent
    >
  {
    my $j = jsc_class_get_parent($!jsc);

    $j ??
      ( $raw ?? $j !! WebkitGTK::JavaScript::Class.new($j) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &jsc_class_get_type, $n, $t );
  }

}
