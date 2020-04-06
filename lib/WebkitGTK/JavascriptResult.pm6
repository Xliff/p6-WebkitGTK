use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::JavascriptResult;

use WebkitGTK::JavaScript::Value;

# Boxed

class WebkitGTK::JavascriptResult {
  has WebKitJavascriptResult $!wjr;

  submethod BUILD (:$result) {
    $!wjr = $result;
  }

  method WebkitGTK::Raw::Definitions::WebKitJavascriptResult
    is also<
      JavascriptResult
      WebKitJavascriptResult
    >
  { $!wjr }

  method new (WebKitJavascriptResult $result) {
    $result ?? self.bless(:$result) !! Nil;
  }

  method get_js_value (:$raw = False) is also<get-js-value> {
    my $val = webkit_javascript_result_get_js_value($!wjr);

    $val ??
      ( $raw ?? $val !! WebkitGTK::JavaScript::Value.new($val) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_javascript_result_get_type,
      $n,
      $t
    );
  }

  method ref is also<upref> {
    webkit_javascript_result_ref($!wjr);
    self;
  }

  method unref is also<downref> {
    webkit_javascript_result_unref($!wjr);
  }

}
