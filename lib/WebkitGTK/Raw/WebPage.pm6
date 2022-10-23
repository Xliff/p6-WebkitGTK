use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use WebkitGTK::Raw::Definitions;

unit package WebkitGTK::Raw::WebPage;

### /usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h

sub webkit_web_page_get_dom_document (WebKitWebPage $web_page)
  returns WebKitDOMDocument
  is native(webkit)
  is export
{ * }

sub webkit_web_page_get_editor (WebKitWebPage $web_page)
  returns WebKitWebEditor
  is native(webkit)
  is export
{ * }

sub webkit_web_page_get_id (WebKitWebPage $web_page)
  returns guint64
  is native(webkit)
  is export
{ * }

sub webkit_web_page_get_main_frame (WebKitWebPage $web_page)
  returns WebKitFrame
  is native(webkit)
  is export
{ * }

sub webkit_web_page_get_type ()
  returns GType
  is native(webkit)
  is export
{ * }

sub webkit_web_page_get_uri (WebKitWebPage $web_page)
  returns Str
  is native(webkit)
  is export
{ * }

sub webkit_web_page_send_message_to_view (
  WebKitWebPage     $web_page,
  WebKitUserMessage $message,
  GCancellable      $cancellable,
                    &callback (WebKitWebPage, GAsyncResult, gpointer),
  gpointer          $user_data
)
  is native(webkit)
  is export
{ * }

sub webkit_web_page_send_message_to_view_finish (
  WebKitWebPage           $web_page,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns WebKitUserMessage
  is native(webkit)
  is export
{ * }
