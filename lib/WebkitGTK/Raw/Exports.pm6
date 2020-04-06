use v6.c;

unit package WebkitGTK::Raw::Exports;

our @webkit-exports is export;

BEGIN {
  @webkit-exports = <
    WebkitGTK::Compat::Types
    WebkitGTK::Raw::Definitions
    WebkitGTK::Raw::Enums
  >;
}
