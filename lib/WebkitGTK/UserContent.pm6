use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::UserContent;

use GTK::Roles::Types;

class WebkitGTK::UserStyleSheet {
  also does GTK::Roles::Types;

  has WebKitUserStyleSheet $!wuss;

  submethod BUILD (:$content) {
    $!wuss = $content;
  }

  multi method new (WebKitUserStyleSheet $content) {
    my $o = self.bless(:$content);
    $o.upref;
  }
  multi method new (
    Str $source,
    Int() $frames,
    Int() $time,
    @whitelist,
    @blacklist,
  ) {
    my $wl = CArray[Str].new(@whitelist);
    my $bl = CArray[Str].new(@blacklist);
    samewith($source, $frames, $time, $wl, $bl);
  }
  multi method new (
    Str $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = self.RESOLVE-UINT($frames, $time);
    self.bless(
      content => webkit_user_style_sheet_new (
        $source, $f, $t, $whitelist, $blacklist
      )
    );
  }

  proto method new_for_world (|)
    is also<new-for-world>
  { * }

  multi method new_for_world (
    Str() $source,
    Int() $frames,
    Int() $time,
    Str() $world_name,
    @whitelist,
    @blacklist,

  ) {
    my $wl = CArray[Str].new(@whitelist);
    my $bl = CArray[Str].new(@blacklist);
    samewith($source, $frames, $time, $wl, $bl);
  }
  multi method new_for_world (
    Str() $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    Str $world_name,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = self.RESOLVE-UINT($frames, $time);
    self.bless(
      content => webkit_user_style_sheet_new_for_world (
        $source, $f, $t, $world_name, $whitelist, $blacklist
      )
    );
  }

  method ref is also<upref> {
    webkit_user_style_sheet_ref($!wuss);
    self;
  }

  method unref is also<downref> {
    webkit_user_style_sheet_unref($!wuss);
  }

}

class WebkitGTK::UserScript {
  also does GTK::Roles::Types;

  has WebKitUserScript $!wus;

  submethod BUILD (:$content) {
    $!wus = $content;
  }

  multi method new (WebKitUserScript $content) {
    my $o = self.bless(:$content);
    $o.upref;
  }
  multi method new (
    Str $source,
    Int() $frames,
    Int() $time,
    @whitelist,
    @blacklist,
  ) {
    my $wl = CArray[Str].new(@whitelist);
    my $bl = CArray[Str].new(@blacklist);
    samewith($source, $frames, $time, $wl, $bl);
  }
  multi method new (
    Str $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = self.RESOLVE-UINT($frames, $time);
    self.bless(
      content => webkit_user_script_new (
        $source, $f, $t, $whitelist, $blacklist
      )
    );
  }

  proto method new_for_world (|)
    is also<new-for-world>
  { * }
  multi method new_for_world (
    Str() $source,
    Int() $frames,
    Int() $time,
    Str() $world_name,
    @whitelist,
    @blacklist,
  ) {
    my $wl = CArray[Str].new(@whitelist);
    my $bl = CArray[Str].new(@blacklist);
    samewith($source, $frames, $time, $wl, $bl);
  }
  multi method new_for_world (
    Str() $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    Str $world_name,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = self.RESOLVE-UINT($frames, $time);
    self.bless(
      content => webkit_user_script_new_for_world (
        $source, $f, $t, $world_name, $whitelist, $blacklist
      )
    );
  }

  method ref is also<upref> {
    webkit_user_script_ref($!wus);
    self;
  }

  method unref is also<downref> {
    webkit_user_script_unref($!wus);
  }

}
