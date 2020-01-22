use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::JavascriptResult;

use WebkitGTK::JavaScript::Value;

# Opaque struct

class WebkitGTK::JavascriptResult {
  has WebKitJavascriptResult $!wjr;

  submethod BUILD (:$result) {
    $!wjr = $result;
  }

  method WebkitGTK::Raw::Definitions::WebKitJavascriptResult
    is also<JavascriptResult>
  { $!wjr }

  method new (WebKitJavascriptResult $result) {
    self.bless(:$result);
  }

  method get_js_value is also<get-js-value> {
    my $val = webkit_javascript_result_get_js_value($!wjr);
    $val.defined ?? WebkitGTK::JavaScript::Value.new($val) !! Nil;
  }

  method get_type is also<get-type> {
    webkit_javascript_result_get_type();
  }

  method ref is also<upref> {
    webkit_javascript_result_ref($!wjr);
  }

  method unref is also<downref> {
    webkit_javascript_result_unref($!wjr);
  }

}
