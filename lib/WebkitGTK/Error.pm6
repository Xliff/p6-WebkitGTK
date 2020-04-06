use v6.c;

use WebkitGTK::Raw::Error;

use GLib::Roles::StaticClass;

class WebkitGTK::Error {
  also does GLib::Roles::StaticClass;

  method download {
    webkit_download_error_quark();
  }

  method javascript {
    webkit_javascript_error_quark();
  }

  method network {
    webkit_network_error_quark();
  }

  method plugin {
    webkit_plugin_error_quark();
  }

  method policy {
    webkit_policy_error_quark();
  }

  method print {
    webkit_print_error_quark();
  }

  method snapshot {
    webkit_snapshot_error_quark();
  }

}
