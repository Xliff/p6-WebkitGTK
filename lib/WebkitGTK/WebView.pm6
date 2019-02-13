use v6.c;

use NativeCall;

use GTK::Compat::RGBA;
use GTK::Compat::Types;
use GTK::Raw::Types;

use GTK::Container;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::WebView;

use WebkitGTK::Roles::Signals::WebView;

use WebkitGTK::JavascriptResult;

use GTK::Roles::References;

class WebkitGTK::WebView is GTK::Container {
  also does GTK::Roles::References;
  also does WebkitGTK::Roles::Signals::WebView;

  has WebKitWebView $!wkv;

  submethod BUILD (:$view) {
    self.setContainer( nativecast(GtkContainer, $!wkv = $view) );
    $!ref = nativecast(GObject, $view);           # GTK::Roles::References
  }

  method WebkitGTK::Raw::Types::WebKitWebView {
    $!wkv;
  }

  multi method new (WebKitWebView $view) {
    my $o = self.bless(:$view);
    $o.upref;
    $o;
  }
  multi method new {
    my $view = webkit_web_view_new();
    self.bless(:$view);
  }

  method custom_charset is rw {
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

  method zoom_level is rw {
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
  method context-menu {
    self.connect-context-menu($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> void
  method context-menu-dismissed {
    self.connect($!wkv, 'context-menu-dismissed');
  }

  # Is originally:
  # WebKitWebView, WebKitNavigationAction, gpointer --> GtkWidget
  method create {
    self.connect-create($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitPolicyDecision, WebKitPolicyDecisionType, gpointer
  method decide-policy {
    self.connect-decide-policy($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> gboolean
  method enter-fullscreen {
    self.connect-rbool($!wkv, 'enter-fullscreen');
  }

  # Is originally:
  # WebKitWebView, uint (WebKitInsecureContentEvent), gpointer --> void
  method insecure-content-detected {
    self.connect-uint($!wkv, 'insecure-content-detected');
  }

  # Is originally:
  # WebKitWebView, gpointer --> gboolean
  method leave-fullscreen {
    self.connect-rbool($!wkv, 'leave-fullscreen');
  }

  # Is originally:
  # WebKitWebView, guint (WebKitLoadEvent), gpointer
  method load-changed {
    self.connect-uint($!wkv, 'load-changed');
  }

  # Is originally:
  # WebKitWebView, guint (WebKitLoadEvent), gchar, GError, gpointer --> gboolean
  method load-failed {
    self.connect-load-event($!wkv);
  }

  # Is originally:
  # WebKitWebView, gchar, GTlsCertificate, GTlsCertificateFlags, gpointer --> gboolean
  method load-failed-with-tls-errors {
    self.connect-load-failed-with-tls-errors($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitHitTestResult, guint, gpointer --> void
  method mouse-target-changed {
    self.connect-mouse-target($!wkv, 'mouse-target-changed');
  }

  # Is originally:
  # WebKitWebView, WebKitPermissionRequest, gpointer -> gboolean
  method permission-request {
    self.connect-permission-request($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitPrintOperation, gpointer --> gboolean
  method print {
    self.connect-print($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> void
  method ready-to-show {
    self.connect($!wkv, 'ready-to-show');
  }

  # Is originally:
  # WebKitWebView, WebKitWebResource, WebKitURIRequest, gpointer --> void
  method resource-load-started {
    self.connect-resource-load-started($!wkv);
  }

  # Is originally:
  # # WebKitWebView, gpointer --> void
  method run-as-modal {
    self.connect($!wkv, 'run-as-modal');
  }

  # Is originally:
  # WebKitWebView, WebKitColorChooserRequest, gpointer --> gboolean
  method run-color-chooser {
    self.connect-color-chooser($!wkv, 'run-color-chooser');
  }

  # Is originally:
  # WebKitWebView, WebKitFileChooserRequest, gpointer --> gboolean
  method run-file-chooser {
    self.connect-file-chooser($!wkv, 'run-file-chooser');
  }

  # Is originally:
  # WebKitWebView, WebKitScriptDialog, gpointer --> gboolean
  method script-dialog {
    self.connect-dialog($!wkv, 'script-dialog');
  }

  # Is originally:
  # WebKitWebView, WebKitNotification, gpointer --> gboolean
  method show-notification {
    self.connect-show-notification($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitOptionMenu, GdkEvent, GdkRectangle, gpointer --> gboolean
  method show-option-menu {
    self.connect-show-option-menu($!wkv);
  }

  # Is originally:
  # WebKitWebView, WebKitFormSubmissionRequest, gpointer --> void
  method submit-form {
    self.connect-submit-form($!wkv);
  }

  # Is originally:
  # WebKitWebView, gpointer --> gboolean
  method web-process-crashed {
    self.connect-rbool($!wkv, 'web-process-crashed');
  }

  # Is originally:
  # WebKitWebView, WebKitWebProcessTerminationReason, gpointer --> void
  method web-process-terminated {
    self.connect-uint($!wkv, 'web-process-terminated');
  }

  method can_execute_editing_command (
    Str() $command,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    webkit_web_view_can_execute_editing_command(
      $!wkv, $command, $cancellable, $callback, $user_data
    );
  }

  method can_execute_editing_command_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    webkit_web_view_can_execute_editing_command_finish($!wkv, $result, $error);
    $ERROR = $error[0].deref with $error[0];
  }

  method can_go_back {
    webkit_web_view_can_go_back($!wkv);
  }

  method can_go_forward {
    webkit_web_view_can_go_forward($!wkv);
  }

  method can_show_mime_type (Str() $mime_type) {
    webkit_web_view_can_show_mime_type($!wkv, $mime_type);
  }

  method download_uri (Str() $uri) {
    webkit_web_view_download_uri($!wkv, $uri);
  }

  method execute_editing_command (Str() $command) {
    webkit_web_view_execute_editing_command($!wkv, $command);
  }

  method execute_editing_command_with_argument (
    Str() $command,
    Str() $argument
  ) {
    webkit_web_view_execute_editing_command_with_argument(
      $!wkv, $command, $argument
    );
  }

  method get_back_forward_list {
    webkit_web_view_get_back_forward_list($!wkv);
  }

  method get_background_color (GdkRGBA $rgba) {
    webkit_web_view_get_background_color($!wkv, $rgba);
  }

  method get_context {
    webkit_web_view_get_context($!wkv);
  }

  method get_editor_state {
    webkit_web_view_get_editor_state($!wkv);
  }

  method get_estimated_load_progress {
    webkit_web_view_get_estimated_load_progress($!wkv);
  }

  method get_favicon {
    webkit_web_view_get_favicon($!wkv);
  }

  method get_find_controller {
    webkit_web_view_get_find_controller($!wkv);
  }

  method get_inspector {
    webkit_web_view_get_inspector($!wkv);
  }

  method get_main_resource {
    webkit_web_view_get_main_resource($!wkv);
  }

  method get_page_id {
    webkit_web_view_get_page_id($!wkv);
  }

  method get_session_state {
    webkit_web_view_get_session_state($!wkv);
  }

  method get_snapshot (
    guint $region,                        # WebKitSnapshotRegion $region,
    guint $options,                       # WebKitSnapshotOptions $options,
    GCancellable $cancellable = Pointer,
    GAsyncReadyCallback $callback = Pointer,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_get_snapshot(
      $!wkv, $region, $options, $cancellable, $callback, $user_data
    );
  }

  method get_snapshot_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    webkit_web_view_get_snapshot_finish($!wkv, $result, $error);
    $ERROR = $error[0].deref with $error[0];
  }

  method get_title {
    webkit_web_view_get_title($!wkv);
  }

  method get_tls_info (
    GTlsCertificate $certificate,
    guint $errors                         # GTlsCertificateFlags $errors
  ) {
    webkit_web_view_get_tls_info($!wkv, $certificate, $errors);
  }

  method get_type {
    webkit_web_view_get_type();
  }

  method get_uri {
    webkit_web_view_get_uri($!wkv);
  }

  method get_user_content_manager {
    webkit_web_view_get_user_content_manager($!wkv);
  }

  method get_website_data_manager {
    webkit_web_view_get_website_data_manager($!wkv);
  }

  method get_window_properties {
    webkit_web_view_get_window_properties($!wkv);
  }

  method go_back {
    webkit_web_view_go_back($!wkv);
  }

  method go_forward {
    webkit_web_view_go_forward($!wkv);
  }

  method go_to_back_forward_list_item (
    WebKitWebView $!wkv,
    WebKitBackForwardListItem $list_item
  ) {
    webkit_web_view_go_to_back_forward_list_item($!wkv, $list_item);
  }

  method is_controlled_by_automation {
    webkit_web_view_is_controlled_by_automation($!wkv);
  }

  method is_editable {
    webkit_web_view_is_editable($!wkv);
  }

  method is_ephemeral {
    webkit_web_view_is_ephemeral($!wkv);
  }

  method is_loading {
    webkit_web_view_is_loading($!wkv);
  }

  method is_playing_audio {
    webkit_web_view_is_playing_audio($!wkv);
  }

  method load_alternate_html (
    Str() $content,
    Str() $content_uri,
    Str() $base_uri
  ) {
    webkit_web_view_load_alternate_html(
      $!wkv, $content, $content_uri, $base_uri
    );
  }

  method load_bytes (
    GBytes $bytes,
    Str() $mime_type,
    Str() $encoding,
    Str() $base_uri
  ) {
    webkit_web_view_load_bytes(
      $!wkv, $bytes, $mime_type, $encoding, $base_uri
    );
  }

  method load_html (
    Str() $content,
    Str() $base_uri
  ) {
    webkit_web_view_load_html($!wkv, $content, $base_uri);
  }

  method load_plain_text (Str() $plain_text) {
    webkit_web_view_load_plain_text($!wkv, $plain_text);
  }

  method load_request (WebKitURIRequest $request) {
    webkit_web_view_load_request($!wkv, $request);
  }

  method load_uri (Str() $uri) {
    webkit_web_view_load_uri($!wkv, $uri);
  }

  method new_with_context (WebKitWebContext $context) {
    webkit_web_view_new_with_context($context);
  }

  method new_with_related_view {
    webkit_web_view_new_with_related_view($!wkv);
  }

  method new_with_settings (WebKitSettings $settings) {
    webkit_web_view_new_with_settings($settings);
  }

  method new_with_user_content_manager (
    WebKitUserContentManager $user_content_manager
  ) {
    webkit_web_view_new_with_user_content_manager($user_content_manager);
  }

  method reload {
    webkit_web_view_reload($!wkv);
  }

  method reload_bypass_cache {
    webkit_web_view_reload_bypass_cache($!wkv);
  }

  method restore_session_state (
    WebKitWebViewSessionState $state
  ) {
    webkit_web_view_restore_session_state($!wkv, $state);
  }

  multi method run_javascript (
    Str() $script,
    &callback,
    GCancellable $cancellable = Pointer,
    gpointer $user_data = Pointer
  ) {
    samewith($script, $cancellable, &callback, $user_data);
  }
  multi method run_javascript (
    Str() $script,
    GCancellable $cancellable,
    &callback,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_run_javascript(
      $!wkv, $script, $cancellable, &callback, $user_data
    );
  }

  method run_javascript_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    my $js_result = webkit_web_view_run_javascript_finish(
      $!wkv, $result, $error
    );
    $ERROR = $error[0].deref with $error[0];
    WebkitGTK::JavascriptResult.new($js_result);
  }

  method run_javascript_from_gresource (
    Str() $resource,
    GCancellable $cancellable = Pointer,
    GAsyncReadyCallback $callback = Pointer,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_run_javascript_from_gresource(
      $!wkv, $resource, $cancellable, $callback, $user_data
    );
  }

  method run_javascript_from_gresource_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    my $js_result = webkit_web_view_run_javascript_from_gresource_finish(
      $!wkv, $result, $error
    );
    $ERROR = $error[0].deref with $error[0];
    WebkitGTK::JavascriptResult.new($js_result);
  }

  method run_javascript_in_world (
    Str() $script,
    Str() $world_name,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback = Pointer,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_run_javascript_in_world(
      $!wkv, $script, $world_name, $cancellable, $callback, $user_data
    );
  }

  method run_javascript_in_world_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    my $js_result = webkit_web_view_run_javascript_in_world_finish(
      $!wkv, $result, $error
    );
    $ERROR = $error[0].deref with $error[0];
    WebkitGTK::JavascriptResult.new($js_result);
  }

  method save (
    WebKitSaveMode $save_mode,
    GCancellable $cancellable,
    GAsyncReadyCallback $callback,
    gpointer $user_data
  ) {
    webkit_web_view_save(
      $!wkv, $save_mode, $cancellable, $callback, $user_data
    );
  }

  method save_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    webkit_web_view_save_finish($!wkv, $result, $error);
    $ERROR = $error[0].deref with $error[0];
  }

  method save_to_file (
    GFile $file,
    Int() $save_mode,                   # WebKitSaveMode $save_mode,
    GCancellable $cancellable = Pointer,
    GAsyncReadyCallback $callback = Pointer,
    gpointer $user_data = Pointer
  ) {
    webkit_web_view_save_to_file(
      $!wkv, $file, $save_mode, $cancellable, $callback, $user_data
    );
  }

  method save_to_file_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror
  ) {
    $ERROR = Nil;
    webkit_web_view_save_to_file_finish($!wkv, $result, $error);
    $ERROR = $error[0].deref with $error[0];
  }

  method set_background_color (GdkRGBA $rgba) {
    webkit_web_view_set_background_color($!wkv, $rgba);
  }

  method set_editable (gboolean $editable) {
    webkit_web_view_set_editable($!wkv, $editable);
  }

  method stop_loading {
    webkit_web_view_stop_loading($!wkv);
  }

  method try_close {
    webkit_web_view_try_close($!wkv);
  }

}
