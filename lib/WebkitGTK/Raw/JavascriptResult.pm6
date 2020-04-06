use v6.c;

use NativeCall;



use WebkitGTK::Raw::Types;
use WebkitGTK::JavaScript::Raw::Types;

unit package WebkitGTK::Raw::JavascriptResult;

sub webkit_javascript_result_get_js_value (WebKitJavascriptResult $js_result)
  returns JSCValue
  is native(webkit)
  is export
  { * }

sub webkit_javascript_result_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_javascript_result_ref (WebKitJavascriptResult $js_result)
  returns WebKitJavascriptResult
  is native(webkit)
  is export
  { * }

sub webkit_javascript_result_unref (WebKitJavascriptResult $js_result)
  is native(webkit)
  is export
  { * }
