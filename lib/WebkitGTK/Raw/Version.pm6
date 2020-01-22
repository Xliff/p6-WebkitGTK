use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::Version;

sub webkit_get_major_version ()
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_get_micro_version ()
  returns guint
  is native(webkit)
  is export
  { * }

sub webkit_get_minor_version ()
  returns guint
  is native(webkit)
  is export
  { * }
