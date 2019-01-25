#!/usr/bin/env perl6

use File::Find;

sub MAIN ($pattern, :$prefix!) {
  $pattern ~~ s/\*//;
  my @files = find
    dir => 'lib',
    name => /{$pattern}/,
    type => 'file';

  my %seen;
  my %seen-enum;
  for @files -> $filename {
    say "Checking { $filename }...";
    my $f = $filename.IO.slurp;
    for $f ~~ m:g/({ $prefix }<[A..Za..z]>+)/ {
      next unless $_.Str.starts-with($prefix);
      my $prospect = $_[0].Str;
      next if %seen{$prospect};
      if / 'Mode' | 'Result' | 'Flags' / {
        %seen-enum{$prospect} = True;
      } else {
        %seen{$prospect} = True;
      }
    }
  }
  say "class $_ is repr(\"CPointer\") is export does GTK::Roles::Pointers;"
    for %seen.keys;
  say "our enum $_ is export <\n>;"
    for %seen-enum.keys;
}
