use v6.c;

use NativeCall;
use Method::Also;

use WebkitGTK::JavaScript::Raw::Types;
use WebkitGTK::JavaScript::Raw::VM;

class WebkitGTK::Java::VM {
  has JSCVirtualMachine $!jvm;

  submethod BUILD (:$jvm) {
    $!jvm = $jvm;
  }

  method new {
    my $jvm = jsc_virtual_machine_new();

    $jvm ?? self.bless(:$jvm) !! Nil;
  }

  method WebkitGTK::JavaScript::Raw::Types::JSCVirtualMachine
    is also<JSCVirtualMachine>
  { $!jvm }

}
