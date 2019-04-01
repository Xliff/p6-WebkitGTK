use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::HitTestResult;

use GTK::Compat::Roles::Object;

class WebkitGTK::HitTestResult {
  also does GTK::Compat::Roles::Object;
  
  has WebKitHitTestResult $!whtr;

  submethod BUILD (:$result) {
    self!setObject($!whtr = $result);
  }

  method WebkitGTK::Raw::Types::WebKitHitTestResult 
    is also<HitTestResult>
  { $!whtr }

  multi method new(WebKitHitTestResult $result) {
    self.bless(:$result);
  }
  multi method new(|c) {
    die "No matching constructor for: ({ c.map( *.^name ).join(', ') })";
  }

  method context_is_editable is also<context-is-editable> {
    so webkit_hit_test_result_context_is_editable($!whtr);
  }

  method context_is_image is also<context-is-image> {
    so webkit_hit_test_result_context_is_image($!whtr);
  }

  method context_is_link is also<context-is-link> {
    so webkit_hit_test_result_context_is_link($!whtr);
  }

  method context_is_media is also<context-is-media> {
    so webkit_hit_test_result_context_is_media($!whtr);
  }

  method context_is_scrollbar is also<context-is-scrollbar> {
    so webkit_hit_test_result_context_is_scrollbar($!whtr);
  }

  method context_is_selection is also<context-is-selection> {
    so webkit_hit_test_result_context_is_selection($!whtr);
  }

  method get_context 
    is also<
      get-context
      context
    > 
  {
    webkit_hit_test_result_get_context($!whtr);
  }

  method get_image_uri 
    is also<
      get-image-uri
      image_uri
      image-uri
    > 
  {
    webkit_hit_test_result_get_image_uri($!whtr);
  }

  method get_link_label 
    is also<
      get-link-label
      link_label
      link-label
    > 
  {
    webkit_hit_test_result_get_link_label($!whtr);
  }

  method get_link_title 
    is also<
      get-link-title
      link_title
      link-title
    > 
  {
    webkit_hit_test_result_get_link_title($!whtr);
  }

  method get_link_uri 
    is also<
      get-link-uri
      link_uri
      link-uri
    > 
  {
    webkit_hit_test_result_get_link_uri($!whtr);
  }

  method get_media_uri 
    is also<
      get-media-uri
      media_uri
      media-uri
    > 
  {
    webkit_hit_test_result_get_media_uri($!whtr);
  }

  method get_type is also<get-type> {
    webkit_hit_test_result_get_type();
  }

}
