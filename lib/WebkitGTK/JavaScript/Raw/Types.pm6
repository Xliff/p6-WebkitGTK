use v6.c;

use GLib::Roles::Pointers;

unit package WebkitGTK::JavaScript::Raw::Types;

constant jsc is export = 'javascriptcoregtk-4.0',v18;

# Number of times compilation has been forced
my constant forced = 222;

class JSCClassVTable      is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCContext          is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCExceptionHandler is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCValue            is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCContect          is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCException        is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCClass            is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCVirtualMachine   is repr("CPointer") is export does GLib::Roles::Pointers { }
class JSCValues           is repr("CPointer") is export does GLib::Roles::Pointers { }