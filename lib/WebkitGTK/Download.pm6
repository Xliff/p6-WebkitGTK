use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Download;

use WebkitGTK::URIResponse;
use WebkitGTK::URIRequest;

use GTK::Roles::Types;
use WebkitGTK::Roles::Signals::Download;

class WebkitGTK::Download {
  also does GTK::Roles::Types;

  has WebKitDownload $!wd;

  submethod BUILD (:$download) {
    $!wd = $download;
  }

  method WebkitGTK::Raw::TYpes::WebKitDownload {
    $!wd;
  }

  method allow_overwrite is rw is also<allow-overwrite> {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_download_get_allow_overwrite($!wd);
      },
      STORE => sub ($, Int() $allowed is copy) {
        my guint32 $a = self.RESOLVE-BOOL($allowed);
        webkit_download_set_allow_overwrite($!wd, $a);
      }
    );
  }

  method destination is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_download_get_destination($!wd);
      },
      STORE => sub ($, Str() $uri is copy) {
        webkit_download_set_destination($!wd, $uri);
      }
    );
  }

  method new (WebKitDownload $download) {
    self.bless(:$download);
  }

  # Is originally:
  # WebKitDownload, gchar, gpointer --> void
  method created-destination is also<created_destination> {
    self.connect-string($!wd);
  }

  # Is originally:
  # WebKitDownload, gchar, gpointer --> gboolean
  method decide-destination is also<decide_destination> {
    self.connect-decide-destination($!wd);
  }

  # Is originally:
  # WebKitDownload, GError, gpointer --> void
  method failed {
    self.connect-failed($!wd);
  }

  # Is originally:
  # WebKitDownload, gpointer --> void
  method finished {
    self.connect($!wd, 'finished');
  }

  # Is originally:
  # WebKitDownload, guint64, gpointer --> void
  method received-data is also<received_data> {
    self.connect-received-data($!wd);
  }

  method cancel {
    webkit_download_cancel($!wd);
  }

  method get_elapsed_time is also<get-elapsed-time> {
    webkit_download_get_elapsed_time($!wd);
  }

  method get_estimated_progress is also<get-estimated-progress> {
    webkit_download_get_estimated_progress($!wd);
  }

  method get_received_data_length is also<get-received-data-length> {
    webkit_download_get_received_data_length($!wd);
  }

  method get_request is also<get-request> {
    webkit_download_get_request($!wd);
  }

  method get_response is also<get-response> {
    webkit_download_get_response($!wd);
  }

  method get_type is also<get-type> {
    webkit_download_get_type();
  }

  method get_web_view is also<get-web-view> {
    ::('WebkitGTK::WebView').new( webkit_download_get_web_view($!wd) );
  }

}

