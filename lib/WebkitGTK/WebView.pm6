use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::RGBA;



use GIO::InputStream;

use GTK::Container;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebView;

use WebkitGTK::Roles::Signals::WebView;

use WebkitGTK::JavascriptResult;
use WebkitGTK::WebContext;

class WebkitGTK::WebView is GTK::Container {
  also does WebkitGTK::Roles::Signals::WebView;

  has WebKitWebView $!wkv;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType(self.^name);
    $o;
  }

  submethod BUILD (:$view) {
    self.setContainer( nativecast(GtkContainer, $!wkv = $view) );
    self.ADD-PREFIX('WebkitGTK::');
  }

  method WebkitGTK::Raw::Definitions::WebKitWebView is also<WebView> { $!wkv }

  multi method new (WebKitWebView $view) {
    my $o = self.bless(:$view);
    $o.upref;
    $o;
  }
  multi method new {
    my $view = webkit_web_view_new();
    self.bless(:$view);
  }

  method custom_charset is rw is also<custom-charset> {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_view_get_custom_charset($!wkv);
      },
      STORE => sub ($, $charset is copy) {
        webkit_web_view_set_custom_charset($!wkv, $charset);
      }
    );
  }

  method settings is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_view_get_settings($!wkv);
      },
      STORE => sub ($, $settings is copy) {
        webkit_web_view_set_settings($!wkv, $settings);
      }
    );
  }

  method zoom_level is rw is also<zoom-level> {
    Proxy.new(
      FETCH => sub ($) {
        webkit_web_view_get_zoom_level($!wkv);
      },
      STORE => sub ($, $zoom_level is copy) {
        webkit_web_view_set_zoom_level($!wkv, $zoom_level);
      }
    );
  }

  # Is originally:
  # WebKitWebView, WebKitAuthenticationRequest, gpointer --> gboolean
  method authenticate {
    self.connect-authenticate($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> void
  method close {
    self.connect($!wkv, 'close');
  }

  # Is originally:
  # WebKitWebView, WebKitContextMenu, GdkEvent, WebKitHitTestResult, gpointer --> gboolean
  method context-menu is also<context_menu> {
    self.connect-context-menu($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> void
  method context-menu-dismissed is also<context_menu_dismissed> {
    self.connect($!wkv, 'context-menu-dismissed');
  }

  # Is originally:
  # WebKitWebView, WebKitNavigationAction, gpointer --> GtkWidget
  method create {
    self.connect-create($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitPolicyDecision, WebKitPolicyDecisionType, gpointer
  method decide-policy is also<decide_policy> {
    self.connect-decide-policy($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> gboolean
  method enter-fullscreen is also<enter_fullscreen> {
    self.connect-rbool($!wkv, 'enter-fullscreen');
  }

  # Is originally:
  # WebKitWebView, uint (WebKitInsecureContentEvent), gpointer --> void
  method insecure-content-detected is also<insecure_content_detected> {
    self.connect-uint($!wkv, 'insecure-content-detected');
  }

  # Is originally:
  # WebKitWebView, gpointer --> gboolean
  method leave-fullscreen is also<leave_fullscreen> {
    self.connect-rbool($!wkv, 'leave-fullscreen');
  }

  # Is originally:
  # WebKitWebView, guint (WebKitLoadEvent), gpointer
  method load-changed is also<load_changed> {
    self.connect-uint($!wkv, 'load-changed');
  }

  # Is originally:
  # WebKitWebView, guint (WebKitLoadEvent), gchar, GError, gpointer --> gboolean
  method load-failed is also<load_failed> {
    self.connect-load-event($!wkv);
  }

  # Is originally:
  # WebKitWebView, gchar, GTlsCertificate, GTlsCertificateFlags, gpointer --> gboolean
  method load-failed-with-tls-errors is also<load_failed_with_tls_errors> {
    self.connect-load-failed-with-tls-errors($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
  method mouse-target-changed is also<mouse_target_changed> {
    self.connect-mouse-target($!wkv, 'mouse-target-changed');
  }

  # Is originally:
  # WebKitWebView, WebKitPermissionRequest, gpointer -> gboolean
  method permission-request is also<permission_request> {
    self.connect-permission-request($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
  method print {
    self.connect-print($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> void
  method ready-to-show is also<ready_to_show> {
    self.connect($!wkv, 'ready-to-show');
  }

  # Is originally:
  # WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
  method resource-load-started is also<resource_load_started> {
    self.connect-resource-load-started($!wkv);
  }

  # Is originally:
  # # WebKitWebView, gpointer --> void
  method run-as-modal is also<run_as_modal> {
    self.connect($!wkv, 'run-as-modal');
  }

  # Is originally:
  # WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
  method run-color-chooser is also<run_color_chooser> {
    self.connect-color-chooser($!wkv, 'run-color-chooser');
  }

  # Is originally:
  # WebKitWebView, WebKitFileChooserRequest, gpointer --> gboolean
  method run-file-chooser is also<run_file_chooser> {
    self.connect-file-chooser($!wkv, 'run-file-chooser');
  }

  # Is originally:
  # WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
  method script-dialog is also<script_dialog> {
    self.connect-dialog($!wkv, 'script-dialog');
  }

  # Is originally:
  # WebKitWebView, WebKitNotification, gpointer --> gboolean
  method show-notification is also<show_notification> {
    self.connect-show-notification($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitOptionMenu, GdkEvent, GdkRectangle, gpointer --> gboolean
  method show-option-menu is also<show_option_menu> {
    self.connect-show-option-menu($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
  method submit-form is also<submit_form> {
    self.connect-submit-form($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> gboolean
  method web-process-crashed is also<web_process_crashed> {
    self.connect-rbool($!wkv, 'web-process-crashed');
  }

  # Is originally:
  # WebKitWebView, WebKitWebProcessTerminationReason, gpointer --> void
  method web-process-terminated is also<web_process_terminated> {
    self.connect-uint($!wkv, 'web-process-terminated');
  }

  proto method can_execute_editing_command (|)
    is also<can-execute-editing-command>
  { * }

  multi method can_execute_editing_command (
    Str() $command,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    samewith($command, GCancellable, $callback, $user_data);
  }
  multi method can_execute_editing_command (
    Str() $command,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    webkit_web_view_can_execute_editing_command(
      $!wkv, $command, $cancellable, $callback, $user_data
    );
  }

  method can_execute_editing_command_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<can-execute-editing-command-finish>
  {
    clear_error;
    my $rv = so webkit_web_view_can_execute_editing_command_finish(
      $!wkv,
      $result,
      $error
    );
    set_error($error);
    $rv;
  }

  method can_go_back is also<can-go-back> {
    so webkit_web_view_can_go_back($!wkv);
  }

  method can_go_forward is also<can-go-forward> {
    so webkit_web_view_can_go_forward($!wkv);
  }

  method can_show_mime_type (Str() $mime_type) is also<can-show-mime-type> {
    so webkit_web_view_can_show_mime_type($!wkv, $mime_type);
  }

  method download_uri (Str() $uri) is also<download-uri> {
    webkit_web_view_download_uri($!wkv, $uri);
  }

  method execute_editing_command (Str() $command)
    is also<execute-editing-command>
  {
    webkit_web_view_execute_editing_command($!wkv, $command);
  }

  method execute_editing_command_with_argument (
    Str() $command,
    Str() $argument
  )
    is also<execute-editing-command-with-argument>
  {
    webkit_web_view_execute_editing_command_with_argument(
      $!wkv, $command, $argument
    );
  }

  method get_back_forward_list is also<get-back-forward-list> {
    webkit_web_view_get_back_forward_list($!wkv);
  }

  method get_background_color (GdkRGBA $rgba) is also<get-background-color> {
    webkit_web_view_get_background_color($!wkv, $rgba);
  }

  method get_context is also<get-context> {
    WebkitGTK::WebContext.new( webkit_web_view_get_context($!wkv) );
  }

  method get_editor_state is also<get-editor-state> {
    webkit_web_view_get_editor_state($!wkv);
  }

  method get_estimated_load_progress is also<get-estimated-load-progress> {
    webkit_web_view_get_estimated_load_progress($!wkv);
  }

  method get_favicon is also<get-favicon> {
    webkit_web_view_get_favicon($!wkv);
  }

  method get_find_controller is also<get-find-controller> {
    webkit_web_view_get_find_controller($!wkv);
  }

  method get_inspector is also<get-inspector> {
    webkit_web_view_get_inspector($!wkv);
  }

  method get_main_resource is also<get-main-resource> {
    webkit_web_view_get_main_resource($!wkv);
  }

  method get_page_id is also<get-page-id> {
    webkit_web_view_get_page_id($!wkv);
  }

  method get_session_state is also<get-session-state> {
    webkit_web_view_get_session_state($!wkv);
  }

  proto method get_snapshot (|)
    is also<get-snapshot>
  { * }

  multi method get_snapshot (
    Int() $region,                        # WebKitSnapshotRegion $region,
    Int() $options,                       # WebKitSnapshotOptions $options,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith($region, $options, GCancellable, $callback, $user_data);
  }
  multi method get_snapshot (
    Int() $region,                        # WebKitSnapshotRegion $region,
    Int() $options,                       # WebKitSnapshotOptions $options,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    my guint ($r, $o) = ($region, $options);

    # cairo_surface_t
    webkit_web_view_get_snapshot(
      $!wkv,
      $r,
      $o,
      $cancellable,
      $callback,
      $user_data
    );
  }

  method get_snapshot_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<get-snapshot-finish>
  {
    clear_error;
    my $rv = webkit_web_view_get_snapshot_finish($!wkv, $result, $error);
    set_error($error);

    # cairo_surface_t
    $rv;
  }

  method get_title
    is also<
      get-title
      title
    >
  {
    webkit_web_view_get_title($!wkv);
  }

  method get_tls_info (
    GTlsCertificate $certificate,
    Int() $errors                         # GTlsCertificateFlags $errors
  )
    is also<get-tls-info>
  {
    my guint $e = self.RESOLVE-UINT($errors);
    webkit_web_view_get_tls_info($!wkv, $certificate, $e);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_web_view_get_type, $n, $t );
  }

  method get_uri
    is also<
      get-uri
      uri
    >
  {
    webkit_web_view_get_uri($!wkv);
  }

  method get_user_content_manager is also<get-user-content-manager> {
    webkit_web_view_get_user_content_manager($!wkv);
  }

  method get_website_data_manager is also<get-website-data-manager> {
    webkit_web_view_get_website_data_manager($!wkv);
  }

  method get_window_properties is also<get-window-properties> {
    webkit_web_view_get_window_properties($!wkv);
  }

  method go_back is also<go-back> {
    webkit_web_view_go_back($!wkv);
  }

  method go_forward is also<go-forward> {
    webkit_web_view_go_forward($!wkv);
  }

  method go_to_back_forward_list_item (
    WebKitBackForwardListItem $list_item
  )
    is also<go-to-back-forward-list-item>
  {
    webkit_web_view_go_to_back_forward_list_item($!wkv, $list_item);
  }

  method is_controlled_by_automation is also<is-controlled-by-automation> {
    so webkit_web_view_is_controlled_by_automation($!wkv);
  }

  method is_editable is also<is-editable> {
    so webkit_web_view_is_editable($!wkv);
  }

  method is_ephemeral is also<is-ephemeral> {
    so webkit_web_view_is_ephemeral($!wkv);
  }

  method is_loading is also<is-loading> {
    so webkit_web_view_is_loading($!wkv);
  }

  method is_playing_audio is also<is-playing-audio> {
    so webkit_web_view_is_playing_audio($!wkv);
  }

  method load_alternate_html (
    Str() $content,
    Str() $content_uri,
    Str() $base_uri
  )
    is also<load-alternate-html>
  {
    webkit_web_view_load_alternate_html(
      $!wkv, $content, $content_uri, $base_uri
    );
  }

  method load_bytes (
    GBytes() $bytes,
    Str() $mime_type,
    Str() $encoding,
    Str() $base_uri
  )
    is also<load-bytes>
  {
    webkit_web_view_load_bytes(
      $!wkv, $bytes, $mime_type, $encoding, $base_uri
    );
  }

  method load_html (
    Str() $content,
    Str() $base_uri
  )
    is also<load-html>
  {
    webkit_web_view_load_html($!wkv, $content, $base_uri);
  }

  method load_plain_text (Str() $plain_text) is also<load-plain-text> {
    webkit_web_view_load_plain_text($!wkv, $plain_text);
  }

  method load_request (WebKitURIRequest() $request) is also<load-request> {
    webkit_web_view_load_request($!wkv, $request);
  }

  method load_uri (Str() $uri) is also<load-uri> {
    webkit_web_view_load_uri($!wkv, $uri);
  }

  method new_with_context (WebKitWebContext() $context)
    is also<new-with-context>
  {
    webkit_web_view_new_with_context($context);
  }

  method new_with_related_view is also<new-with-related-view> {
    webkit_web_view_new_with_related_view($!wkv);
  }

  method new_with_settings (WebKitSettings() $settings)
    is also<new-with-settings>
  {
    webkit_web_view_new_with_settings($settings);
  }

  method new_with_user_content_manager (
    WebKitUserContentManager() $user_content_manager
  )
    is also<new-with-user-content-manager>
  {
    webkit_web_view_new_with_user_content_manager($user_content_manager);
  }

  method reload {
    webkit_web_view_reload($!wkv);
  }

  method reload_bypass_cache is also<reload-bypass-cache> {
    webkit_web_view_reload_bypass_cache($!wkv);
  }

  method restore_session_state (
    WebKitWebViewSessionState() $state
  )
    is also<restore-session-state>
  {
    webkit_web_view_restore_session_state($!wkv, $state);
  }

  proto method run_javascript (|)
    is also<run-javascript>
  { * }

  multi method run_javascript (
    Str() $script,
    &callback,
    gpointer $user_data = Pointer
  ) {
    samewith($script, GCancellable, &callback, $user_data);
  }
  multi method run_javascript (
    Str() $script,
    GCancellable() $cancellable,
    &callback,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_run_javascript(
      $!wkv, $script, $cancellable, &callback, $user_data
    );
  }

  method run_javascript_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror,
    :$raw = False
  )
    is also<run-javascript-finish>
  {
    clear_error;
    my $js_result = webkit_web_view_run_javascript_finish(
      $!wkv, $result, $error
    );
    set_error($error);

    $js_result ??
      ( $raw ?? $js_result !! WebkitGTK::JavascriptResult.new($js_result) )
      !!
      Nil;
  }

  proto method run_javascript_from_gresource (|)
    is also<run-javascript-from-gresource>
  { * }

  multi method run_javascript_from_gresource (
    Str() $resource,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith($resource, GCancellable, $callback, $user_data);
  }
  multi method run_javascript_from_gresource (
    Str() $resource,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_run_javascript_from_gresource(
      $!wkv, $resource, $cancellable, $callback, $user_data
    );
  }

  method run_javascript_from_gresource_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<run-javascript-from-gresource-finish>
  {
    clear_error;
    my $js_result = webkit_web_view_run_javascript_from_gresource_finish(
      $!wkv, $result, $error
    );
    set_error($error);
    WebkitGTK::JavascriptResult.new($js_result);
  }

  proto method run_javascript_in_world (|)
    is also<run-javascript-in-world>
  { * }

  multi method run_javascript_in_world (
    Str() $script,
    Str() $world_name,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith($script, $world_name, GCancellable, $callback, $user_data);
  }
  multi method run_javascript_in_world (
    Str() $script,
    Str() $world_name,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback = Pointer,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_run_javascript_in_world(
      $!wkv, $script, $world_name, $cancellable, $callback, $user_data
    );
  }

  method run_javascript_in_world_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror,
    :$raw = False
  )
    is also<run-javascript-in-world-finish>
  {
    clear_error;
    my $js_result = webkit_web_view_run_javascript_in_world_finish(
      $!wkv, $result, $error
    );
    set_error($error);

    $js_result ??
      ( $raw ?? $js_result !! WebkitGTK::JavascriptResult.new($js_result) )
      !!
      Nil;
  }

  multi method save (
    WebKitSaveMode $save_mode,
    GAsyncReadyCallback $callback,
    gpointer $user_data = gpointer
  ) {
    samewith($save_mode, GCancellable, $callback, $user_data);
  }
  multi method save (
    WebKitSaveMode $save_mode,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = gpointer
  ) {
    webkit_web_view_save(
      $!wkv, $save_mode, $cancellable, $callback, $user_data
    );
  }

  method save_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror,
    :$raw = False
  )
    is also<save-finish>
  {
    clear_error;
    my $rv = webkit_web_view_save_finish($!wkv, $result, $error);
    set_error($error);

    $rv ??
      ( $raw ?? $rv !! GIO::InputStream.new($rv) )
      !!
      Nil;
  }

  proto method save_to_file (|)
    is also<save-to-file>
  { * }

  multi method save_to_file (
    GFile() $file,
    Int() $save_mode,                   # WebKitSaveMode $save_mode,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    samewith($file, $save_mode, GCancellable, $callback, $user_data);
  }
  multi method save_to_file (
    GFile() $file,
    Int() $save_mode,                   # WebKitSaveMode $save_mode,
    GCancellable() $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_save_to_file(
      $!wkv, $file, $save_mode, $cancellable, $callback, $user_data
    );
  }

  method save_to_file_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<save-to-file-finish>
  {
    clear_error;
    my $rv = so webkit_web_view_save_to_file_finish($!wkv, $result, $error);
    set_error($error);
    $rv;
  }

  method set_background_color (GdkRGBA $rgba) is also<set-background-color> {
    webkit_web_view_set_background_color($!wkv, $rgba);
  }

  method set_editable (Int() $editable) is also<set-editable> {
    my gboolean $e = self.RESOLVE-BOOL($editable);
    webkit_web_view_set_editable($!wkv, $e);
  }

  method stop_loading is also<stop-loading> {
    webkit_web_view_stop_loading($!wkv);
  }

  method try_close is also<try-close> {
    webkit_web_view_try_close($!wkv);
  }

}
