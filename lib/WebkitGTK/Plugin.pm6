use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Plugin;

use GLib::GList;
use WebkitGTK::MimeInfo;

use GLib::Roles::Object;
use GLib::Roles::ListData;

class WebkitGTK::Plugin {
  also does GLib::Roles::Object;

  has WebKitPlugin $!wp;

  submethod BUILD (:$plugin) {
    self!setObject($!wp = $plugin);
  }

  method WebkitGTK::Raw::Definitions::WebKitPlugin
    is also<
      Plugin
      WebKitPlugin
    >
  { $!wp }

  method new (WebKitPlugin $plugin) {
    $plugin ?? self.bless(:$plugin) !! Nil;
  }

  method get_description is also<
    get-description
    description
  > {
    webkit_plugin_get_description($!wp);
  }

  method get_mime_info_list (:$glist = False, :$raw = False)
    is also<
      get-mime-info-list
      mime_info_list
      mime-info-list
    >
  {
    my $il = webkit_plugin_get_mime_info_list($!wp);

    return Nil unless $il;
    return $il if $glist;

    $il = GLib::GList($il).new but GLib::Roles::ListData[WebKitMimeInfo];
    $raw ?? $il.Array !! $il.Array.map({ WebkitGTK::MimeInfo.new($_) });
  }

  method get_name is also<
    get-name
    name
  > {
    webkit_plugin_get_name($!wp);
  }

  method get_path is also<
    get-path
    path
  > {
    webkit_plugin_get_path($!wp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_plugin_get_type,
      $n,
      $t
    );
  }

}
