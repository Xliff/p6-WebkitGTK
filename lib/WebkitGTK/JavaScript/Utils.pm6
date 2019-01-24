use v6.c;

use NativeCall;

use WebkitGTK::Javascript::Raw::Types;

unit package WebkitGTK::Javascript::Utils;

sub paramsToCArray(@parameters) is export {
  die '@parameters must be JSCValues' unless @parameters.all ~~ JSCValue;
  my $p = CArray[JSCValue].new;
  $p[$_] = @parameters[$_] for ^@parameters.elems;
  $p;
}

sub typesToCArray(@types) is export {
  die '@parameters must be list of GTypeEnum compatible integers'
    unless @types.all ~~ Int;
  my $p = CArray[uint32].new;
  $p[$_] = @types[$_] for ^@types.elems;
  $p;
}
