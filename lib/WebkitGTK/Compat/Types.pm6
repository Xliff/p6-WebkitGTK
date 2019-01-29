use v6.c;

use NativeCall;

use GTK::Compat::Types;

unit package WebkitGTK::Compat::Types;

constant SoupMessageHeaders is export := Pointer;

sub webkit_gerror is export {
  my $c = CArray[GError].new;
  $c;
}
