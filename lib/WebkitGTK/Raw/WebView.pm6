use v6.c;

use NativeCall;

use Cairo;

use GTK::Compat::RGBA;
use GTK::Compat::Types;
use GTK::Raw::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WebView;

sub webkit_web_view_can_execute_editing_command (
  WebKitWebView $web_view,
  Str $command,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_can_execute_editing_command_finish (
  WebKitWebView $web_view,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_can_go_back (WebKitWebView $web_view)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_can_go_forward (WebKitWebView $web_view)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_can_show_mime_type (
  WebKitWebView $web_view,
  Str $mime_type
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_download_uri (WebKitWebView $web_view, Str $uri)
  returns WebKitDownload
  is native(webkit)
  is export
  { * }

sub webkit_web_view_execute_editing_command (
  WebKitWebView $web_view,
  Str $command
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_execute_editing_command_with_argument (
  WebKitWebView $web_view,
  Str $command,
  Str $argument
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_back_forward_list (WebKitWebView $web_view)
  returns WebKitBackForwardList
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_background_color (
  WebKitWebView $web_view,
  GdkRGBA $rgba
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_context (WebKitWebView $web_view)
  returns WebKitWebContext
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_editor_state (WebKitWebView $web_view)
  returns WebKitEditorState
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_estimated_load_progress (WebKitWebView $web_view)
  returns gdouble
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_favicon (WebKitWebView $web_view)
  returns cairo_surface_t
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_find_controller (WebKitWebView $web_view)
  returns WebKitFindController
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_inspector (WebKitWebView $web_view)
  returns WebKitWebInspector
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_main_resource (WebKitWebView $web_view)
  returns WebKitWebResource
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_page_id (WebKitWebView $web_view)
  returns guint64
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_session_state (WebKitWebView $web_view)
  returns WebKitWebViewSessionState
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_snapshot (
  WebKitWebView $web_view,
  guint $region,                  # WebKitSnapshotRegion $region,
  guint $options,                 # WebKitSnapshotOptions $options,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_snapshot_finish (
  WebKitWebView $web_view,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns cairo_surface_t
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_title (WebKitWebView $web_view)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_tls_info (
  WebKitWebView $web_view,
  GTlsCertificate $certificate,
  guint $errors                   # GTlsCertificateFlags $errors
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_uri (WebKitWebView $web_view)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_user_content_manager (WebKitWebView $web_view)
  returns WebKitUserContentManager
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_website_data_manager (WebKitWebView $web_view)
  returns WebKitWebsiteDataManager
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_window_properties (WebKitWebView $web_view)
  returns WebKitWindowProperties
  is native(webkit)
  is export
  { * }

sub webkit_web_view_go_back (WebKitWebView $web_view)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_go_forward (WebKitWebView $web_view)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_go_to_back_forward_list_item (
  WebKitWebView $web_view,
  WebKitBackForwardListItem $list_item)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_is_controlled_by_automation (WebKitWebView $web_view)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_is_editable (WebKitWebView $web_view)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_is_ephemeral (WebKitWebView $web_view)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_is_loading (WebKitWebView $web_view)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_is_playing_audio (WebKitWebView $web_view)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_load_alternate_html (
  WebKitWebView $web_view,
  Str $content,
  Str $content_uri,
  Str $base_uri
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_load_bytes (
  WebKitWebView $web_view,
  GBytes $bytes,
  Str $mime_type,
  Str $encoding,
  Str $base_uri
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_load_html (
  WebKitWebView $web_view,
  Str $content,
  Str $base_uri
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_load_plain_text (
  WebKitWebView $web_view,
  Str $plain_text
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_load_request (
  WebKitWebView $web_view,
  WebKitURIRequest $request
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_load_uri (WebKitWebView $web_view, Str $uri)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_new ()
  returns WebKitWebView
  is native(webkit)
  is export
  { * }

sub webkit_web_view_new_with_context (WebKitWebContext $context)
  returns WebKitWebView
  is native(webkit)
  is export
  { * }

sub webkit_web_view_new_with_related_view (WebKitWebView $web_view)
  returns WebKitWebView
  is native(webkit)
  is export
  { * }

sub webkit_web_view_new_with_settings (WebKitSettings $settings)
  returns WebKitWebView
  is native(webkit)
  is export
  { * }

sub webkit_web_view_new_with_user_content_manager (
  WebKitUserContentManager $user_content_manager
)
  returns WebKitWebView
  is native(webkit)
  is export
  { * }

sub webkit_web_view_reload (WebKitWebView $web_view)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_reload_bypass_cache (WebKitWebView $web_view)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_restore_session_state (
  WebKitWebView $web_view,
  WebKitWebViewSessionState $state
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_run_javascript (
  WebKitWebView $web_view,
  Str $script,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_run_javascript_finish (
  WebKitWebView $web_view,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns WebKitJavascriptResult
  is native(webkit)
  is export
  { * }

sub webkit_web_view_run_javascript_from_gresource (
  WebKitWebView $web_view,
  Str $resource,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_run_javascript_from_gresource_finish (
  WebKitWebView $web_view,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns WebKitJavascriptResult
  is native(webkit)
  is export
  { * }

sub webkit_web_view_run_javascript_in_world (
  WebKitWebView $web_view,
  Str $script,
  Str $world_name,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_run_javascript_in_world_finish (
  WebKitWebView $web_view,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns WebKitJavascriptResult
  is native(webkit)
  is export
  { * }

sub webkit_web_view_save (
  WebKitWebView $web_view,
  guint $save_mode,               # WebKitSaveMode $save_mode,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_save_finish (
  WebKitWebView $web_view,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns GInputStream
  is native(webkit)
  is export
  { * }

sub webkit_web_view_save_to_file (
  WebKitWebView $web_view,
  GFile $file,
  guint $save_mode,               # WebKitSaveMode $save_mode,
  GCancellable $cancellable,
  GAsyncReadyCallback $callback,
  gpointer $user_data
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_save_to_file_finish (
  WebKitWebView $web_view,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_web_view_set_background_color (
  WebKitWebView $web_view,
  GdkRGBA $rgba
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_set_editable (
  WebKitWebView $web_view,
  gboolean $editable
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_stop_loading (WebKitWebView $web_view)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_try_close (WebKitWebView $web_view)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_settings (WebKitWebView $web_view)
  returns WebKitSettings
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_zoom_level (WebKitWebView $web_view)
  returns gdouble
  is native(webkit)
  is export
  { * }

sub webkit_web_view_get_custom_charset (WebKitWebView $web_view)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_web_view_set_settings (
  WebKitWebView $web_view,
  WebKitSettings $settings
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_set_zoom_level (
  WebKitWebView $web_view,
  gdouble $zoom_level
)
  is native(webkit)
  is export
  { * }

sub webkit_web_view_set_custom_charset (WebKitWebView $web_view, Str $Strset)
  is native(webkit)
  is export
  { * }
