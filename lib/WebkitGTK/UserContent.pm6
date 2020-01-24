use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::UserContent;

class WebkitGTK::UserStyleSheet {
  has WebKitUserStyleSheet $!wuss;

  submethod BUILD (:$content) {
    $!wuss = $content;
  }

  submethod DESTROY {
    self.unref;
  }

  multi method new (WebKitUserStyleSheet $content, :$ref = True) {
    my $o = self.bless(:$content);
    $o.ref if $ref;
    $o;
  }
  multi method new (
    Str $source,
    Int() $frames,
    Int() $time,
    @whitelist,
    @blacklist,
  ) {
    samewith(
      $source,
      $frames,
      $time,
      ArrayToCArray(Str, @whitelist),
      ArrayToCArray(Str, @blacklist)
    );
  }
  multi method new (
    Str $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = $frames, $time;
    my $content = webkit_user_style_sheet_new(
      $source,
      $f,
      $t,
      $whitelist,
      $blacklist
    );

    $content ?? self.bless(:$content) !! Nil;
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
    @blacklist
  ) {
    samewith(
      $source,
      $frames,
      $time,
      ArrayToCArray(Str, @whitelist),
      ArrayToCArray(Str, @blacklist)
    );
  }
  multi method new_for_world (
    Str() $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    Str $world_name,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = $frames, $time;
    my $content = webkit_user_style_sheet_new_for_world (
      $source,
      $f,
      $t,
      $world_name,
      $whitelist,
      $blacklist
    );

    $content ?? self.bless(:$content) !! Nil;
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
  has WebKitUserScript $!wus;

  submethod BUILD (:$content) {
    $!wus = $content;
  }

  method DESTROY {
    self.unref;
  }

  multi method new (WebKitUserScript $content, :$ref = True) {
    return Nil unless $content;

    my $o = self.bless(:$content);
    $o.ref if $ref;
    $o;
  }
  multi method new (
    Str $source,
    Int() $frames,
    Int() $time,
    @whitelist,
    @blacklist,
  ) {
    samewith(
      $source,
      $frames,
      $time,
      ArrayToCArray(Str, @whitelist),
      ArrayToCArray(Str, @blacklist)
    );
  }
  multi method new (
    Str $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = $frames, $time;
    my $content = webkit_user_script_new(
      $source,
      $f,
      $t,
      $whitelist,
      $blacklist
    );

    $content ?? self.bless(:$content) !! Nil;
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
    samewith(
      $source,
      $frames,
      $time,
      ArrayToCArray(Str, @whitelist),
      ArrayToCArray(Str, @blacklist)
    );
  }
  multi method new_for_world (
    Str() $source,
    Int() $frames,          # WebKitUserContentInjectedFrames injected_frames,
    Int() $time,            # WebKitUserScriptInjectionTime   injection_time,
    Str $world_name,
    CArray[Str] $whitelist,
    CArray[Str] $blacklist
  ) {
    my guint ($f, $t) = $frames, $time;
    my $content = webkit_user_script_new_for_world(
      $source,
      $f,
      $t,
      $world_name,
      $whitelist,
      $blacklist
    );

    $content ?? self.bless(:$content) !! Nil;
  }

  method ref is also<upref> {
    webkit_user_script_ref($!wus);
    self;
  }

  method unref is also<downref> {
    webkit_user_script_unref($!wus);
  }

}
