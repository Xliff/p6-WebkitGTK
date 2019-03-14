use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Plugin;

class WebkitGTK::Plugin {
  has WebKitPlugin $!wp;

  submethod BUILD (:$plugin) {
    $!wp = $plugin;
  }

  method new (WebKitPlugin $plugin) {
    self.bless(:$plugin);
  }

  method get_description is also<get-description> {
    webkit_plugin_get_description($!wp);
  }

  method get_mime_info_list is also<get-mime-info-list> {
    # Convert GList to @
    webkit_plugin_get_mime_info_list($!wp);
  }

  method get_name is also<get-name> {
    webkit_plugin_get_name($!wp);
  }

  method get_path is also<get-path> {
    webkit_plugin_get_path($!wp);
  }

  method get_type is also<get-type> {
    webkit_plugin_get_type();
  }

}

