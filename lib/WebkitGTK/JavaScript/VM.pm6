use v6.c;

use NativeCall;

use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::VM;

class WebkitGTK::Java::VM {
  has JSCVirtualMachine $!jvm;

  method new {
    self.bless( jvm => jsc_virtual_machine_new() )
  }
}
