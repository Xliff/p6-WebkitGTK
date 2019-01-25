use v6.c;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::JavascriptResult;

use WebkitGTK::JavaScript::Value;

class WebkitGTK::JavascriptResult {
  has WebKitJavascriptResult $!wjr;

  submethod BUILD (:$result) {
    $!wjr = $result;
  }

  method new (WebKitJavascriptResult $result) {
    self.bless(:$result);
  }

  method get_js_value {
    my $val = webkit_javascript_result_get_js_value($!wjr);
    $val.defined ?? WebkitGTK::JavaScript::Value.new($val) !! Nil;
  }

  method get_type {
    webkit_javascript_result_get_type();
  }

  method ref {
    webkit_javascript_result_ref($!wjr);
  }

  method unref {
    webkit_javascript_result_unref($!wjr);
  }

}
