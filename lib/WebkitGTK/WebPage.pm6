use v6.c;

use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebPage;

#use WebKit::DOM::Document;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class WebkitGTK::WebPage {
  also does GLib::Roles::Object;

  has WebKitWebPage $!wwp is implementor;

  method webkit_web_page_get_dom_document ( :$raw = False ) {
    propReturnObject(
      webkit_web_page_get_dom_document($!wwp),
      $raw,
      |WebKit::DOM::Document.getTypePair
    );
  }

  method webkit_web_page_get_editor ( :$raw = False ) {
    propReturnObject(
      webkit_web_page_get_editor($!wwp),
      $raw,
      |Webkit::WebEditor.getTypePair
    );
  }

  method webkit_web_page_get_id {
    webkit_web_page_get_id($!wwp);
  }

  method webkit_web_page_get_main_frame ( :$raw = False ) {
    propReturnObject(
      webkit_web_page_get_main_frame($!wwp),
      $raw,
      |Webkit::Frame.getTypePair
    );
  }

  method webkit_web_page_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_web_page_get_type, $n, $t );
  }

  method webkit_web_page_get_uri {
    webkit_web_page_get_uri($!wwp);
  }

  proto method webkit_web_page_send_message_to_view (|)
  { * }

  multi method webkit_web_page_send_message_to_view (
    WebKitUserMessage()  $message,
                         &callback,
    gpointer             $user_data     = gpointer,
    GCancellable()      :$cancellable   = GCancellable
  ) {
    samewith(
      $message,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method webkit_web_page_send_message_to_view (
    WebKitUserMessage() $message,
    GCancellable()      $cancellable,
                        &callback,
    gpointer            $user_data     = gpointer
  ) {
    webkit_web_page_send_message_to_view(
      $!wwp,
      $message,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method webkit_web_page_send_message_to_view_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     = False
  ) {
    clear_error();
    my $um = webkit_web_page_send_message_to_view_finish(
      $!wwp,
      $result,
      $error
    );
    set_error($error);
    propReturnObject($um, $raw, |Webkit::UserMesssage.getTypePair);
  }

}
