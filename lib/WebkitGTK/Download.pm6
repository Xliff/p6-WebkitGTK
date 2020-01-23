use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Download;

use GLib::Roles::Object;
use WebkitGTK::URIRequest;
use WebkitGTK::URIResponse;
use WebkitGTK::WebView;

use WebkitGTK::Roles::Signals::Download;

class WebkitGTK::Download {
  also does GLib::Roles::Object;

  has WebKitDownload $!wd;

  submethod BUILD (:$download) {
    self!setObject($!wd = $download);
  }

  method WebkitGTK::Raw::Definitions::WebKitDownload
    is also<
      Download
      WebKitDownload
    >
  { $!wd }

  method new (WebKitDownload $download) {
    $download ?? self.bless(:$download) !! Nil;
  }

  method allow_overwrite is rw is also<allow-overwrite> {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_download_get_allow_overwrite($!wd);
      },
      STORE => sub ($, Int() $allowed is copy) {
        my gboolean $a = $allowed.so.Int;

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

  method get_estimated_progress is also<
    get-estimated-progress
    estimated_progress
    estimated-progress
  > {
    webkit_download_get_estimated_progress($!wd);
  }

  method get_received_data_length is also<get-received-data-length> {
    webkit_download_get_received_data_length($!wd);
  }

  method get_request (:$raw = False) is also<get-request> {
    my $uri = webkit_download_get_request($!wd);

    $uri ??
      ( $raw ?? $uri !! WebkitGTK::URIRequest.new($uri) )
      !!
      Nil;
  }

  method get_response (:$raw = False)
    is also<
      get-response
      response
    >
  {
    my $r = webkit_download_get_response($!wd);

    $r ??
      ( $raw ?? $r !! WebkitGTK::URIResponse.new($r) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_download_get_type, $n, $t );
  }

  method get_web_view (:$raw = False)
    is also<
      get-web-view
      web_view
      web-view
    >
  {
    my $wv = webkit_download_get_web_view($!wd);

    $wv ??
      ( $raw ?? $wv !! WebkitGTK::WebView.new($wv) )
      !!
      Nil;
  }

}
