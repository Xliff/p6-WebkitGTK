use v6.c;

use WebkitGTK::JavaScript::Raw::Types;

unit package WebkitGTK::Javascript::Raw::VM;

sub jsc_virtual_machine_new
  returns JSCVirtualMachine
  is native(jsc)
  is export
  { * }
