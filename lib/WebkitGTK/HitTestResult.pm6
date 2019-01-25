use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::HitTestResult;

class WebkitGTK::HitTestResult {
  has WebKitHitTestResult $!whtr;

  submethod BUILD (:$result) {
    $!whtr = $result;
  }

  multi method new(WebKitHitTestResult $result) {
    self.bless(:$result);
  }
  multi method new(|c) {
    die "No matching constructor for: ({ c.map( *.^name ).join(', ') })";
  }

  method context_is_editable {
    so webkit_hit_test_result_context_is_editable($!whtr);
  }

  method context_is_image {
    so webkit_hit_test_result_context_is_image($!whtr);
  }

  method context_is_link {
    so webkit_hit_test_result_context_is_link($!whtr);
  }

  method context_is_media {
    so webkit_hit_test_result_context_is_media($!whtr);
  }

  method context_is_scrollbar {
    so webkit_hit_test_result_context_is_scrollbar($!whtr);
  }

  method context_is_selection {
    so webkit_hit_test_result_context_is_selection($!whtr);
  }

  method get_context {
    webkit_hit_test_result_get_context($!whtr);
  }

  method get_image_uri {
    webkit_hit_test_result_get_image_uri($!whtr);
  }

  method get_link_label {
    webkit_hit_test_result_get_link_label($!whtr);
  }

  method get_link_title {
    webkit_hit_test_result_get_link_title($!whtr);
  }

  method get_link_uri {
    webkit_hit_test_result_get_link_uri($!whtr);
  }

  method get_media_uri {
    webkit_hit_test_result_get_media_uri($!whtr);
  }

  method get_type {
    webkit_hit_test_result_get_type();
  }

}
