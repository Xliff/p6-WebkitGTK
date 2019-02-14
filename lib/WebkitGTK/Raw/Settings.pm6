use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::Settings;

sub webkit_settings_font_size_to_pixels (guint32 $points)
  returns guint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_font_size_to_points (guint32 $pixels)
  returns guint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_settings_new ()
  returns WebKitSettings
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_user_agent_with_application_details (
  WebKitSettings $settings,
  Str $application_name,
  Str $application_version
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_media_capabilities (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_hyperlink_auditing (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_developer_extras (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_media_playback_requires_user_gesture (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_allow_modal_dialogs (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_fantasy_font_family (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_fullscreen (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_html5_local_storage (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_webgl (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_write_console_messages_to_stdout (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_media_playback_allows_inline (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_xss_auditor (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_print_backgrounds (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_tabs_to_links (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_spatial_navigation (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_mediasource (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_allow_universal_access_from_file_urls (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_javascript (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_allow_file_access_from_file_urls (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_cursive_font_family (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_page_cache (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_user_agent (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_offline_web_application_cache (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_hardware_acceleration_policy (
  WebKitSettings $settings
)
  returns uint32 # WebKitHardwareAccelerationPolicy
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_javascript_can_open_windows_automatically (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_caret_browsing (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_smooth_scrolling (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_site_specific_quirks (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_media_stream (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_plugins (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_sans_serif_font_family (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_default_charset (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_draw_compositing_indicators (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_monospace_font_family (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_default_font_family (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_minimum_font_size (WebKitSettings $settings)
  returns guint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_frame_flattening (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_serif_font_family (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_default_monospace_font_size (WebKitSettings $settings)
  returns guint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_resizable_text_areas (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_auto_load_images (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_html5_database (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_pictograph_font_family (WebKitSettings $settings)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_default_font_size (WebKitSettings $settings)
  returns guint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_dns_prefetching (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_accelerated_2d_canvas (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_zoom_text_only (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_load_icons_ignoring_image_load_setting (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_encrypted_media (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_javascript_can_access_clipboard (
  WebKitSettings $settings
)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_java (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_get_enable_webaudio (WebKitSettings $settings)
  returns uint32
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_media_capabilities (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_hyperlink_auditing (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_developer_extras (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_media_playback_requires_user_gesture (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_allow_modal_dialogs (
  WebKitSettings $settings,
  gboolean $allowed
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_fantasy_font_family (
  WebKitSettings $settings,
  Str $fantasy_font_family
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_fullscreen (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_html5_local_storage (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_webgl (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_write_console_messages_to_stdout (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_media_playback_allows_inline (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_xss_auditor (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_print_backgrounds (
  WebKitSettings $settings,
  gboolean $print_backgrounds
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_tabs_to_links (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_spatial_navigation (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_mediasource (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_allow_universal_access_from_file_urls (
  WebKitSettings $settings,
  gboolean $allowed
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_javascript (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_allow_file_access_from_file_urls (
  WebKitSettings $settings,
  gboolean $allowed
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_cursive_font_family (
  WebKitSettings $settings,
  Str $cursive_font_family
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_page_cache (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_user_agent (
  WebKitSettings $settings,
  Str $user_agent
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_offline_web_application_cache (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_hardware_acceleration_policy (
  WebKitSettings $settings,
  uint32 $policy                  # WebKitHardwareAccelerationPolicy $policy
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_javascript_can_open_windows_automatically (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_caret_browsing (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_smooth_scrolling (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_site_specific_quirks (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_media_stream (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_plugins (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_sans_serif_font_family (
  WebKitSettings $settings,
  Str $sans_serif_font_family
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_default_charset (
  WebKitSettings $settings,
  Str $default_charset
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_draw_compositing_indicators (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_monospace_font_family (
  WebKitSettings $settings,
  Str $monospace_font_family
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_default_font_family (
  WebKitSettings $settings,
  Str $default_font_family
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_minimum_font_size (
  WebKitSettings $settings,
  guint32 $font_size
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_frame_flattening (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_serif_font_family (
  WebKitSettings $settings,
  Str $serif_font_family
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_default_monospace_font_size (
  WebKitSettings $settings,
  guint32 $font_size
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_resizable_text_areas (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_auto_load_images (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_html5_database (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_pictograph_font_family (
  WebKitSettings $settings,
  Str $pictograph_font_family
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_default_font_size (
  WebKitSettings $settings,
  guint32 $font_size
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_dns_prefetching (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_accelerated_2d_canvas (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_zoom_text_only (
  WebKitSettings $settings,
  gboolean $zoom_text_only
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_load_icons_ignoring_image_load_setting (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_encrypted_media (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_javascript_can_access_clipboard (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_java (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }

sub webkit_settings_set_enable_webaudio (
  WebKitSettings $settings,
  gboolean $enabled
)
  is native(webkit)
  is export
  { * }
