use v6.c;

use GTK::Roles::Pointers;

unit package WebkitGTK::JavaScript::Types;

constant jsc is export = 'javascriptcoregtk-4.0',v18;

class JSCClassVTable      is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCContext          is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCExceptionHandler is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCValue            is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCContect          is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCException        is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCClass            is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCVirtualMachine   is repr("CPointer") is export does GTK::Roles::Pointers;
class JSCValues           is repr("CPointer") is export does GTK::Roles::Pointers;

our enum JSCCheckSyntaxResult is export <
  A1
>;

our enum JSCCheckSyntaxMode is export <
  A2
>;

our enum JSCValuePropertyFlags is export <
  A3
>;
