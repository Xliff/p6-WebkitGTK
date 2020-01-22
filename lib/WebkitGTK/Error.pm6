use v6.c;

use NativeCall;



use WebkitGTK::Raw::Error;

class WebkitGTK::Error {

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
